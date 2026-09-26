import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../theme/app_theme.dart';
import '../../widgets/segmented_pill.dart';

const _kLastModuleKey = 'last_module';

enum AppModule { clinical, exercise, study }

class NavTab {
  const NavTab(this.icon, this.label, this.path);
  final IconData icon;
  final String label;
  final String path;
}

extension AppModuleX on AppModule {
  Color get accent => switch (this) {
        AppModule.clinical => kClinical,
        AppModule.exercise => kExercise,
        AppModule.study => kStudy,
      };

  List<NavTab> get tabs => switch (this) {
        AppModule.clinical => const [
            NavTab(Icons.people_rounded, 'Patients', '/'),
            NavTab(Icons.bar_chart_rounded, 'Insights', '/insights'),
            NavTab(Icons.ios_share_rounded, 'Export', '/export'),
          ],
        AppModule.exercise => const [
            NavTab(Icons.calendar_today_rounded, 'Calendar', '/exercise'),
            NavTab(Icons.bar_chart_rounded, 'Stats', '/exercise/stats'),
          ],
        AppModule.study => const [
            NavTab(Icons.calendar_today_rounded, 'Calendar', '/study'),
            NavTab(Icons.checklist_rounded, 'Tasks', '/study/tasks'),
            NavTab(Icons.insights_rounded, 'Progress', '/study/progress'),
          ],
      };

  /// Branch index this module's first tab occupies.
  int get firstBranch => switch (this) {
        AppModule.clinical => 0,
        AppModule.exercise => 3,
        AppModule.study => 5,
      };

  String get rootPath => tabs.first.path;
}

/// Branches run left-to-right in the order they appear on screen, so the
/// index delta between any two destinations gives the travel direction.
AppModule moduleOfBranch(int branch) {
  if (branch >= AppModule.study.firstBranch) return AppModule.study;
  if (branch >= AppModule.exercise.firstBranch) return AppModule.exercise;
  return AppModule.clinical;
}

Future<void> rememberModule(String rootPath) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(_kLastModuleKey, rootPath);
}

/// Read at startup so the app reopens on the module you left it in.
Future<String> lastModulePath() async {
  final prefs = await SharedPreferences.getInstance();
  final saved = prefs.getString(_kLastModuleKey);
  final valid = AppModule.values.any((m) => m.rootPath == saved);
  return valid ? saved! : AppModule.clinical.rootPath;
}

/// One shell across all three modules. Each tab is a branch with its own
/// navigator, which is what lets the container animate between them without
/// duplicating a navigator key — and what keeps each tab's state alive.
class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.shell});
  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    final module = moduleOfBranch(shell.currentIndex);
    final tabs = module.tabs;
    final selected = shell.currentIndex - module.firstBranch;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
              child: SegmentedPill(
                selected: module.index,
                options: const [
                  SegmentOption(label: 'Clinical', icon: Icons.add_rounded, accent: kClinical),
                  SegmentOption(label: 'Exercise', icon: Icons.fitness_center_rounded, accent: kExercise),
                  SegmentOption(label: 'Study', icon: Icons.menu_book_rounded, accent: kStudy),
                ],
                onSelect: (i) {
                  final target = AppModule.values[i];
                  if (target.firstBranch == shell.currentIndex) return;
                  shell.goBranch(target.firstBranch);
                  rememberModule(target.rootPath);
                },
              ),
            ),
            Expanded(child: shell),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: tabs.length > 2 ? 20 : 32,
            vertical: 6,
          ),
          child: Row(
            spacing: tabs.length > 2 ? 6 : 8,
            children: [
              for (var i = 0; i < tabs.length; i++)
                Expanded(
                  child: _NavButton(
                    tab: tabs[i],
                    active: i == selected,
                    accent: module.accent,
                    onTap: () {
                      final target = module.firstBranch + i;
                      // Re-tapping the active tab pops it back to its root.
                      shell.goBranch(target,
                          initialLocation: target == shell.currentIndex);
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({
    required this.tab,
    required this.active,
    required this.accent,
    required this.onTap,
  });

  final NavTab tab;
  final bool active;
  final Color accent;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final fg = active ? accent : kMuted;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        height: 52,
        decoration: BoxDecoration(
          color: active ? accent.withValues(alpha: 0.10) : Colors.transparent,
          borderRadius: BorderRadius.circular(kRadCard),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(tab.icon, size: 19, color: fg),
            const SizedBox(height: 3),
            Text(
              tab.label,
              style: kArchivo(
                size: 10.5,
                weight: active ? FontWeight.w600 : FontWeight.w500,
                color: fg,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
