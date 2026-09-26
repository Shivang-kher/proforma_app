import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'config/supabase_config.dart';
import 'providers/database_provider.dart';
import 'router.dart';
import 'screens/auth/lock_screen.dart';
import 'screens/auth/pin_setup_screen.dart';
import 'screens/shell/app_shell.dart';
import 'screens/study/task_providers.dart';
import 'services/auth_service.dart';
import 'services/notification_service.dart';
import 'services/sync_service.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  assert(
    supabaseUrl.isNotEmpty && supabaseAnonKey.isNotEmpty,
    'Missing Supabase credentials. Run with: flutter run --dart-define-from-file=.env.json',
  );
  await NotificationService.instance.init();
  await Supabase.initialize(url: supabaseUrl, publishableKey: supabaseAnonKey);
  await AuthService.instance.init();
  // Resolved before the first frame so the app opens directly on the module
  // you left it in, with no flash of the default one.
  final startLocation = await lastModulePath();
  runApp(ProviderScope(
    child: ProformaApp(router: createRouter(initialLocation: startLocation)),
  ));
}

class ProformaApp extends ConsumerStatefulWidget {
  const ProformaApp({super.key, required this.router});
  final GoRouter router;

  @override
  ConsumerState<ProformaApp> createState() => _ProformaAppState();
}

class _ProformaAppState extends ConsumerState<ProformaApp>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    unawaited(SyncService.instance.init(ref.read(databaseProvider)));
    // iOS drops scheduled notifications across reinstalls, so rebuild them.
    unawaited(ref.read(taskActionsProvider).rearmAll());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    SyncService.instance.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      AuthService.instance.onBackground();
    } else if (state == AppLifecycleState.resumed) {
      unawaited(AuthService.instance.onForeground());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Proforma',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: widget.router,
      builder: (context, child) {
        return ListenableBuilder(
          listenable: AuthService.instance,
          builder: (context, _) {
            if (!AuthService.instance.isPinSet) {
              return const PinSetupScreen();
            }
            if (AuthService.instance.isLocked) {
              return const LockScreen();
            }
            return child ?? const SizedBox();
          },
        );
      },
    );
  }
}
