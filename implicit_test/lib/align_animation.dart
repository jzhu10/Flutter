import 'package:flutter/material.dart';

class AlignAnimation extends StatefulWidget {
  const AlignAnimation({super.key});

  @override
  State<AlignAnimation> createState() => _AlignAnimationState();
}

class _AlignAnimationState extends State<AlignAnimation> {
  bool isTopLeft = true;

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
              child: AnimatedAlign(
                duration: const Duration(seconds: 1),
                alignment:
                    isTopLeft ? Alignment.topLeft : Alignment.bottomRight,
                child: const Text('Opacity animation'),
              ),
            ),
            const SizedBox(height: 10),
            FilledButton(
              onPressed: () {
                setState(() {
                  isTopLeft = !isTopLeft;
                });
              },
              child: const Text('Change align'),
            ),
          ],
        ),
      ),
    );
  }
}
