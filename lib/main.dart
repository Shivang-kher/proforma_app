import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'config/supabase_config.dart';
import 'providers/database_provider.dart';
import 'router.dart';
import 'services/notification_service.dart';
import 'services/sync_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  assert(
    supabaseUrl.isNotEmpty && supabaseAnonKey.isNotEmpty,
    'Missing Supabase credentials. Run with: flutter run --dart-define-from-file=.env.json',
  );
  await NotificationService.instance.init();
  await Supabase.initialize(url: supabaseUrl, publishableKey: supabaseAnonKey);
  runApp(const ProviderScope(child: ProformaApp()));
}

class ProformaApp extends ConsumerStatefulWidget {
  const ProformaApp({super.key});

  @override
  ConsumerState<ProformaApp> createState() => _ProformaAppState();
}

class _ProformaAppState extends ConsumerState<ProformaApp> {
  @override
  void initState() {
    super.initState();
    unawaited(SyncService.instance.init(ref.read(databaseProvider)));
  }

  @override
  void dispose() {
    SyncService.instance.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Proforma',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A56DB),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A56DB),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
