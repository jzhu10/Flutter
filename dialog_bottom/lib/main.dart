import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum PizzaType {
  pepperoni,
  fourSeasons,
  marinara,
  margarita,
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // Persist bottom sheet
    return Scaffold(
      bottomSheet: BottomSheet(
          backgroundColor: Colors.purple[100],
          enableDrag: false,
          showDragHandle: false,
          onClosing: () {},
          shape: const ContinuousRectangleBorder(),
          builder: (context) {
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: const Text("Persistent bottom sheet"),
            );
          }),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Show dialog
            FilledButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const Dialog(
                    child: Center(child: Text('Hello')),
                  ),
                );
              },
              child: const Text('Show dialog'),
            ),
            const SizedBox(height: 20),

            // Alert dialog
            FilledButton(
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Alert dialog'),
                    content:
                        const Text('This is an alert dialog we are testing'),
                    actions: [
                      FilledButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'))
                    ],
                  ),
                );
              },
              child: const Text('Show alert dialog'),
            ),
            const SizedBox(height: 20),

            // Alert dialog ok-cancel
            FilledButton(
              onPressed: () async {
                bool? result = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Alert dialog'),
                    content:
                        const Text('This is an alert dialog we are testing'),
                    actions: [
                      FilledButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: const Text('OK'),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: const Text('Cancel'),
                      ),
                    ],
                  ),
                );
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Recieve $result')));
              },
              child: const Text('Alert dialog ok-cancel'),
            ),
            const SizedBox(height: 20),

            // Simple dialog
            FilledButton(
              onPressed: () async {
                PizzaType? type = await showDialog<PizzaType>(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      title: const Text('Simple dialog'),
                      children: PizzaType.values.map((type) {
                        return SimpleDialogOption(
                          child: Text(type.name),
                          onPressed: () {
                            Navigator.of(context).pop(type);
                          },
                        );
                      }).toList(),
                    );
                  },
                  barrierDismissible: false,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Recieved ${type?.name}'),
                  ),
                );
              },
              child: const Text('Simple dialog'),
            ),
            const SizedBox(height: 20),

            // Full screen
            FilledButton(
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (context) => Dialog.fullscreen(
                    backgroundColor: Colors.purple[50],
                    child: Center(
                      child: FilledButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Hello'),
                      ),
                    ),
                  ),
                );
              },
              child: const Text('Full screen dialog'),
            ),
            const SizedBox(height: 20),

            // Modal bottom sheet
            FilledButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => const Dialog(
                          child: Text('Bottom sheet body'),
                        ));
              },
              child: const Text('Modal bottom sheet'),
            ),
            const SizedBox(height: 20),

            // Test of non modal bottom sheet
            // This is not working because the context does not cantain scarffold
            // The context refer to the context of the builder(above the scaffold)
            FilledButton(
              onPressed: () {
                showBottomSheet(
                    context: context, // context
                    builder: (context) => const Dialog(
                          child: Text('Bottom sheet body'),
                        ));
              },
              child: const Text('Bottom sheet'),
            ),
            const SizedBox(height: 20),

            // Example in the slide
            const ShowBottomSheetButton(),
            FilledButton(
              child: const Text("Scaffold.showBottomSheet"),
              onPressed: () {
                Scaffold.of(context).showBottomSheet(
                  (context) {
                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      child: const Text("Persistent Bottom Sheet"),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ShowBottomSheetButton extends StatelessWidget {
  const ShowBottomSheetButton({super.key});
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      child: const Text("Scaffold.showBottomSheet"),
      onPressed: () {
        Scaffold.of(context).showBottomSheet(
          (context) {
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: const Text("Persistent Bottom Sheet"),
            );
          },
        );
      },
    );
  }
}
