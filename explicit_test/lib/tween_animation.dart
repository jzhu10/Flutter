import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  const TweenAnimation({super.key});

  @override
  State<TweenAnimation> createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation>
    with SingleTickerProviderStateMixin {
  final double _elementSize = 200;
  Color _elementColor = Colors.black;
  final Color _blue = Colors.blue;
  final Color _amber = Colors.amber;

  late AnimationController controller;
  late Animation<Color?> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = ColorTween(begin: _blue, end: _amber).animate(controller);
    controller.addListener(() {
      setState(() {
        _elementColor = animation.value ?? Colors.yellow;
        ;
      });
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
            Container(
              width: _elementSize,
              height: _elementSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: _elementColor,
              ),
            ),
            const SizedBox(height: 10),
            FilledButton(
              onPressed: () {
                _animateElementColor();
              },
              child: const Text('Change element color'),
            ),
          ],
        ),
      ),
    );
  }
}
