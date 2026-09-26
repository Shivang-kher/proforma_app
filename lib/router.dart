import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/shell/app_shell.dart';
import 'screens/shell/branch_container.dart';
import 'screens/home/patient_list_screen.dart';
import 'screens/patient/patient_detail_screen.dart';
import 'screens/forms/form1_registration.dart';
import 'screens/forms/form2_pre_chemo.dart';
import 'screens/forms/form3_post_chemo.dart';
import 'screens/forms/form4_cytoreduction.dart';
import 'screens/forms/form5_relapse.dart';
import 'screens/export/export_screen.dart';
import 'screens/insights/insights_screen.dart';
import 'screens/exercise/exercise_month_screen.dart';
import 'screens/exercise/exercise_stats_screen.dart';
import 'screens/study/study_month_screen.dart';
import 'screens/study/task_list_screen.dart';
import 'screens/study/study_progress_screen.dart';

/// One branch per destination. Each gets its own navigator, so branches can be
/// animated between and each keeps its own state while parked.
StatefulShellBranch _branch(String path, Widget screen) => StatefulShellBranch(
      routes: [
        GoRoute(
          path: path,
          pageBuilder: (_, state) =>
              NoTransitionPage(key: state.pageKey, child: screen),
        ),
      ],
    );

GoRouter createRouter({String initialLocation = '/'}) => GoRouter(
  initialLocation: initialLocation,
  routes: [
    // One shell across all three modules — branch order left-to-right matches
    // the on-screen order, which is what gives transitions their direction.
    StatefulShellRoute(
      builder: (context, state, shell) => AppShell(shell: shell),
      navigatorContainerBuilder: (_, shell, children) => BranchContainer(
        currentIndex: shell.currentIndex,
        children: children,
      ),
      branches: [
        // Clinical
        _branch('/', const PatientListScreen()),
        _branch('/insights', const InsightsScreen()),
        _branch('/export', const ExportScreen()),
        // Exercise
        _branch('/exercise', const ExerciseMonthScreen()),
        _branch('/exercise/stats', const ExerciseStatsScreen()),
        // Study / Work
        _branch('/study', const StudyMonthScreen()),
        _branch('/study/tasks', const TaskListScreen()),
        _branch('/study/progress', const StudyProgressScreen()),
      ],
    ),

    // ── Full-screen routes (no shell/module strip) ───────────
    GoRoute(
      path: '/patient/new',
      builder: (_, _) => const Form1Registration(),
    ),
    GoRoute(
      path: '/patient/:id',
      builder: (_, state) => PatientDetailScreen(
        patientId: int.parse(state.pathParameters['id']!),
      ),
    ),
    GoRoute(
      path: '/patient/edit/:id',
      builder: (_, state) => Form1Registration(
        patientId: int.parse(state.pathParameters['id']!),
      ),
    ),
    GoRoute(
      path: '/form/pre-chemo/:id',
      builder: (_, state) => Form2PreChemo(
        patientId: int.parse(state.pathParameters['id']!),
      ),
    ),
    GoRoute(
      path: '/form/post-chemo/:id',
      builder: (_, state) => Form3PostChemo(
        patientId: int.parse(state.pathParameters['id']!),
      ),
    ),
    GoRoute(
      path: '/form/cytoreduction/:id',
      builder: (_, state) => Form4Cytoreduction(
        patientId: int.parse(state.pathParameters['id']!),
      ),
    ),
    GoRoute(
      path: '/form/relapse/:id',
      builder: (_, state) => Form5Relapse(
        patientId: int.parse(state.pathParameters['id']!),
      ),
    ),
  ],
  errorBuilder: (_, state) => Scaffold(
    body: Center(child: Text('Page not found: ${state.error}')),
  ),
    );
