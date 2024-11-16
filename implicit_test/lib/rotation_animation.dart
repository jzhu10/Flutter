import 'package:flutter/material.dart';

class RotationAnimation extends StatefulWidget {
  const RotationAnimation({super.key});

  @override
  State<RotationAnimation> createState() => _RotationAnimationState();
}

class _RotationAnimationState extends State<RotationAnimation> {
  double turns = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.amber,
              width: 200,
              height: 200,
              child: AnimatedRotation(
                duration: const Duration(seconds: 1),
                turns: turns,
                child: const Text('Opacity animation'),
              ),
            ),
            const SizedBox(height: 10),
            FilledButton(
              onPressed: () {
                setState(() {
                  turns += 1.0 / 4.0;
                });
              },
              child: const Text('Change rotation'),
            ),
          ],
        ),
      ),
    );
  }
}
