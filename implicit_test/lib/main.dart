import 'package:flutter/material.dart';
import 'package:implicit_test/align_animation.dart';
import 'package:implicit_test/fade_animation.dart';
import 'package:implicit_test/opacity_animation.dart';
import 'package:implicit_test/rotation_animation.dart';
import 'package:implicit_test/switcher_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SwitcherAnimation(),
    );
  }
}
