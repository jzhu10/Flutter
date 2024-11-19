import 'package:flutter/material.dart';

class Exploration extends StatefulWidget {
  const Exploration({super.key});

  @override
  State<Exploration> createState() => _ExplorationState();
}

class _ExplorationState extends State<Exploration> {
  Map<String, dynamic> formValues = {};
  GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final String text = _controller.text.toLowerCase();
      _controller.value = _controller.value.copyWith(
        text: text,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          TextFormField(
            initialValue: formValues['name'],
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
            onSaved: (value) => formValues['name'] = value,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field cannot be empty';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
