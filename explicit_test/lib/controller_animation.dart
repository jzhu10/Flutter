import 'package:flutter/material.dart';

class ControllerAnimation extends StatefulWidget {
  const ControllerAnimation({super.key});

  @override
  State<ControllerAnimation> createState() => _ControllerAnimationState();
}

class _ControllerAnimationState extends State<ControllerAnimation>
    with SingleTickerProviderStateMixin {
  double _elementSize = 100;
  final double _increasedSize = 200;

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    controller.addListener(() {
      setState(() {
        _elementSize = controller.value * _increasedSize;
      });
    });
  }

  void _animateElementSize() {
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
                color: Colors.amber,
              ),
            ),
            const SizedBox(height: 10),
            FilledButton(
              onPressed: () {
                _animateElementSize();
              },
              child: const Text('Change element size'),
            ),
          ],
        ),
      ),
    );
  }
}
