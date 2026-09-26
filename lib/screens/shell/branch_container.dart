import 'package:flutter/material.dart';

/// Holds every branch navigator alive at once and slides between them.
///
/// The direction comes from the index delta, so moving right in the tab order
/// travels right — the same motion whether it is a tab or a module switch.
/// Inactive branches stay mounted (state is preserved) but are taken offstage
/// with their tickers muted so they cost nothing.
class BranchContainer extends StatefulWidget {
  const BranchContainer({
    super.key,
    required this.currentIndex,
    required this.children,
  });

  final int currentIndex;
  final List<Widget> children;

  @override
  State<BranchContainer> createState() => _BranchContainerState();
}

class _BranchContainerState extends State<BranchContainer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 280),
    value: 1,
  );

  late int _current = widget.currentIndex;
  int? _outgoing;
  double _direction = 1;
  int _transition = 0;

  @override
  void didUpdateWidget(covariant BranchContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentIndex != _current) {
      _direction = widget.currentIndex > _current ? 1 : -1;
      _outgoing = _current;
      _current = widget.currentIndex;

      // TickerFuture completes on cancel too, so restarting the controller
      // still fires the previous whenComplete. Without this guard a fast
      // second switch clears the newer transition's outgoing branch mid-flight
      // and it pops out instead of drifting.
      final token = ++_transition;
      _controller.forward(from: 0).whenComplete(() {
        if (mounted && token == _transition) setState(() => _outgoing = null);
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (var i = 0; i < widget.children.length; i++) _branch(i),
      ],
    );
  }

  Widget _branch(int i) {
    final isCurrent = i == _current;
    final isOutgoing = i == _outgoing;

    // Parked branch: mounted for its state, but invisible and not ticking.
    if (!isCurrent && !isOutgoing) {
      return Offstage(
        child: TickerMode(enabled: false, child: widget.children[i]),
      );
    }

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final t = Curves.easeOutCubic.transform(_controller.value);
        // Incoming travels the full width; outgoing drifts a third of it, which
        // reads as depth rather than two panels sliding in lockstep.
        final dx = isCurrent ? (1 - t) * _direction : -t * _direction * 0.3;
        final opacity = (isCurrent ? t : 1 - t).clamp(0.0, 1.0);

        return IgnorePointer(
          ignoring: !isCurrent,
          child: FractionalTranslation(
            translation: Offset(dx, 0),
            child: Opacity(opacity: opacity, child: child),
          ),
        );
      },
      child: TickerMode(enabled: isCurrent, child: widget.children[i]),
    );
  }
}
