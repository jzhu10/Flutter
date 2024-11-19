import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomFormTest extends StatefulWidget {
  final String title;

  const CustomFormTest({super.key, required this.title});

  @override
  State<CustomFormTest> createState() => _CustomFormTestState();
}

class _CustomFormTestState extends State<CustomFormTest> {
  Map<String, dynamic> formValues = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: DateFormField(
        initialValue: formValues['date'],
        validator: (value) {
          if (value == null) {
            return "Date cannot be empty";
          }
          return null;
        },
        onSaved: (value) {
          formValues['date'] = value;
        },
      ),
    );
  }
}

// Create an extension to the FormField<T> class implementing onSave(),
// validator() along with initialValue parameter.
class DateFormField extends FormField<DateTime> {
  final DateFormat? dateFormat;

  DateFormField(
      {super.key,
      super.autovalidateMode,
      super.enabled,
      super.initialValue,
      super.onSaved,
      super.validator,
      super.restorationId,
      super.forceErrorText,
      this.dateFormat})
      : super(builder: (state) {
          return DateFormFieldWidget(
            state: state,
            dateFormat: dateFormat ?? DateFormat.yMd(),
          );
        });
}

// The purpose of the stateful widget is to expose a TextField and initiale the
// showDatePicker(). Why stateful? To access the dispose method in order to
// dispose of the TextEditingController().
class DateFormFieldWidget extends StatefulWidget {
  const DateFormFieldWidget({
    super.key,
    required this.state,
    required this.dateFormat,
  });
  final FormFieldState<DateTime> state;
  final DateFormat dateFormat;

  @override
  State<DateFormFieldWidget> createState() => _DateFormFieldWidgetState();
}

class _DateFormFieldWidgetState extends State<DateFormFieldWidget> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = widget.state.value == null
        ? ''
        : widget.dateFormat.format(widget.state.value!);
  }

  @override
  Widget build(BuildContext context) {
    controller.text = widget.state.value == null
        ? ""
        : widget.dateFormat.format(widget.state.value!);
    return TextField(
      controller: controller,
      decoration:
          InputDecoration(labelText: 'Date', errorText: widget.state.errorText),
      onTap: () async {
        DateTime? val = await showDatePicker(
          initialDate: widget.state.value,
          context: widget.state.context,
          firstDate: DateTime.utc(2024),
          lastDate: DateTime.utc(2026),
        );
        // Access the state of the FormField and stores the newly received value
        // and trigger a rebuild of the tree.
        // In this step the value of the TextField is set by accessing the
        // controller.
        widget.state.didChange(val);
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
