import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShellScreen extends StatelessWidget {
  const ShellScreen({super.key, required this.child});
  final Widget child;

  static const _tabs = [
    (icon: Icons.people_rounded,    label: 'Patients', path: '/'),
    (icon: Icons.bar_chart_rounded, label: 'Insights', path: '/insights'),
    (icon: Icons.ios_share_rounded, label: 'Export',   path: '/export'),
  ];

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = location.startsWith('/insights')
        ? 1
        : location.startsWith('/export')
            ? 2
            : 0;

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (i) => context.go(_tabs[i].path),
        destinations: _tabs
            .map((t) => NavigationDestination(icon: Icon(t.icon), label: t.label))
            .toList(),
      ),
    );
  }
}
