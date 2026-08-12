import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/shell_screen.dart';
import 'screens/home/patient_list_screen.dart';
import 'screens/patient/patient_detail_screen.dart';
import 'screens/forms/form1_registration.dart';
import 'screens/forms/form2_pre_chemo.dart';
import 'screens/forms/form3_post_chemo.dart';
import 'screens/forms/form4_cytoreduction.dart';
import 'screens/forms/form5_relapse.dart';
import 'screens/export/export_screen.dart';
import 'screens/insights/insights_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (_, state, child) => ShellScreen(child: child),
      routes: [
        GoRoute(
          path: '/',
          builder: (_, _) => const PatientListScreen(),
        ),
        GoRoute(
          path: '/insights',
          builder: (_, _) => const InsightsScreen(),
        ),
        GoRoute(
          path: '/export',
          builder: (_, _) => const ExportScreen(),
        ),
      ],
    ),

    // Full-screen routes (no bottom nav)
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
