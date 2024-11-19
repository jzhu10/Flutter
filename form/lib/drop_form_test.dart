import 'package:flutter/material.dart';

class DropFormTest extends StatefulWidget {
  const DropFormTest({super.key, required this.title});
  final String title;

  @override
  State<DropFormTest> createState() => _DropFormTestState();
}

const toppings = ["Pepperoni", "Ham", "Vegeterian", "Margarita"];

enum Gender {
  male(description: "Male"),
  female(description: "Female"),
  transGender(description: "Transgender"),
  nonBinary(description: "Non-binary"),
  preferNoToSay(description: "Prefer not to say");

  final String description;
  const Gender({required this.description});
}

class _DropFormTestState extends State<DropFormTest> {
  Map<String, dynamic> formValues = {};
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    formValues['name'] = 'John Doe';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // // Dropdown form
              // // Unable to see selected items
              // DropdownButtonFormField<String>(
              //   decoration: const InputDecoration(labelText: 'Topping'),
              //   value: 'Pepperoni',
              //   validator: (value) {
              //     if (value == null) {
              //       return 'Please select a value';
              //     }
              //     return null;
              //   },
              //   onSaved: (value) {
              //     formValues['topping'] = value;
              //     print('onSaved called');
              //   },
              //   isExpanded: true,
              //   items: toppings.map(
              //     (topping) {
              //       return DropdownMenuItem<String>(
              //         value: topping,
              //         child: Text(topping),
              //       );
              //     },
              //   ).toList(),
              //   onChanged: (value) {
              //     print('onChanged called');
              //     print('1 version: ${formValues['topping']}');
              //   },
              // ),

              // Dropdown form
              // Control over the rendering of menu items
              DropdownButtonFormField<String>(
                focusColor: Colors.blue[100],
                decoration: const InputDecoration(labelText: 'Topping'),
                value: 'Pepperoni',
                validator: (value) {
                  if (value == null) {
                    return 'Please select a value';
                  }
                  return null;
                },
                onSaved: (value) {
                  formValues['topping'] = value;
                },
                isExpanded: true,
                selectedItemBuilder: (context) {
                  return toppings.map((topping) {
                    return Text(topping);
                  }).toList();
                },
                items: toppings.map((topping) {
                  return DropdownMenuItem<String>(
                      value: topping,
                      child: Text(
                        topping,
                        style: formValues['topping'] == topping
                            ? TextStyle(color: Colors.blue)
                            : null,
                      ));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    formValues['topping'] = value;
                    print('2 version: ${formValues['topping']}');
                  });
                },
              ),

              // Dropdowns with Enums
              DropdownButtonFormField(
                value: formValues['gender'],
                validator: (value) {
                  if (value == null) {
                    return 'Please select a value';
                  }
                  return null;
                },
                onSaved: (value) {
                  formValues['gender'] = value;
                },
                selectedItemBuilder: (context) {
                  return Gender.values.map((gender) {
                    return Text(gender.description);
                  }).toList();
                },
                items: Gender.values.map((gender) {
                  return DropdownMenuItem(
                      value: gender,
                      child: Text(gender.description,
                          style: formValues['gender'] == gender
                              ? TextStyle(color: Colors.blue)
                              : null));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    formValues['gender'] = value;
                  });
                },
              ),

              // Submit button
              const SizedBox(height: 20),
              FilledButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('name ${formValues['name']}'),
                      ),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
