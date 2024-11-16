import 'package:flutter/material.dart';

class SwitcherAnimation extends StatefulWidget {
  const SwitcherAnimation({super.key});

  @override
  State<SwitcherAnimation> createState() => _SwitcherAnimationState();
}

class _SwitcherAnimationState extends State<SwitcherAnimation> {
  late Widget childWidget;
  bool showFirstChild = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedSwitcher(
              duration: const Duration(seconds: 2),
              switchInCurve: Curves.easeInOutCubic,
              switchOutCurve: Curves.fastLinearToSlowEaseIn,
              // transitionBuilder: (Widget child, Animation<double> animation) =>
              //     ScaleTransition(scale: animation, child: child),
              transitionBuilder: (Widget child, Animation<double> animation) =>
                  RotationTransition(turns: animation, child: child),
              child: showFirstChild ? const FirstChild() : const SecondChild(),
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () {
                setState(() {
                  showFirstChild = !showFirstChild;
                });
              },
              child: const Text('Switch'),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstChild extends StatelessWidget {
  const FirstChild({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        key: UniqueKey(),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.amber,
        ));
  }
}

class SecondChild extends StatelessWidget {
  const SecondChild({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        key: UniqueKey(),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.blue,
        ));
  }
}

class ThirdChild extends StatelessWidget {
  const ThirdChild({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        key: UniqueKey(),
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
        ));
  }
}
