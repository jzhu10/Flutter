import 'package:flutter/material.dart';

class CurveAnimation extends StatefulWidget {
  const CurveAnimation({super.key});

  @override
  State<CurveAnimation> createState() => _CurveAnimationState();
}

class AnimatedContainer extends AnimatedWidget {
  const AnimatedContainer({super.key, required Animation<double> animation})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    double maxSize = 300;
    double minSize = 50;

    final opacityTween = Tween<double>(begin: 0.1, end: 1);
    final sizeTween = Tween<double>(begin: minSize, end: maxSize);

    final animation = listenable as Animation<double>;
    return Opacity(
      opacity: opacityTween.evaluate(animation),
      child: Container(
        width: sizeTween.evaluate(animation),
        height: sizeTween.evaluate(animation),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.amber,
        ),
      ),
    );
  }
}

class _CurveAnimationState extends State<CurveAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);

    // With status notification to do loop
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn)
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
              child: const Text('Loop element size and opacity with curve'),
            ),
          ],
        ),
      ),
    );
  }
}
