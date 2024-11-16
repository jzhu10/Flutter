import 'package:flutter/material.dart';

class FadeAmimation extends StatefulWidget {
  const FadeAmimation({super.key});

  @override
  State<FadeAmimation> createState() => _FadeAmimationState();
}

class _FadeAmimationState extends State<FadeAmimation> {
  bool showFirst = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedCrossFade(
              duration: const Duration(seconds: 1),
              firstChild:
                  Container(color: Colors.amber, width: 100, height: 100),
              secondChild:
                  Container(color: Colors.blue, width: 200, height: 200),
              crossFadeState: showFirst
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
            const SizedBox(height: 10),
            FilledButton(
              onPressed: () {
                setState(() {
                  showFirst = !showFirst;
                });
              },
              child: const Text('Change child'),
            ),
          ],
        ),
      ),
    );
  }
}
