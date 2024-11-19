import 'package:flutter/material.dart';
import 'package:form/custom_form_test.dart';
import 'package:form/drop_form_test.dart';
import 'package:form/exploration.dart';
import 'package:form/text_form_test.dart';

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
      // home: const CustomFormTest(title: 'Froms Demo'),
      home: const Exploration(),
    );
  }
}
