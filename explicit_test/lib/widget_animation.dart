import 'package:flutter/material.dart';

class WidgetAnimation extends StatefulWidget {
  const WidgetAnimation({super.key});

  @override
  State<WidgetAnimation> createState() => _WidgetAnimationState();
}

class AnimatedContainer extends AnimatedWidget {
  const AnimatedContainer({super.key, required Animation<double> animation})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Container(
      width: animation.value,
      height: animation.value,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.amber,
      ),
    );
  }
}

class _WidgetAnimationState extends State<WidgetAnimation>
    with SingleTickerProviderStateMixin {
  final double _maxSize = 300;
  final double _minSize = 50;

  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);

    // With status notification to do loop
    animation =
        Tween<double>(begin: _minSize, end: _maxSize).animate(controller)
          ..addStatusListener((status) {
            switch (status) {
              case AnimationStatus.completed:
                controller.reverse();
                break;
              case AnimationStatus.dismissed:
                controller.forward();
                break;
              default:
            }
          });
  }

  void _animateElementColor() {
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(animation: animation),
            const SizedBox(height: 10),
            FilledButton(
              onPressed: () {
                _animateElementColor();
              },
              child: const Text('Loop element size'),
            ),
          ],
        ),
      ),
    );
  }
}
