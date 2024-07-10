import 'package:flutter/material.dart';

class IsolatesScreen extends StatefulWidget {
  const IsolatesScreen({super.key});

  @override
  State<IsolatesScreen> createState() => _IsolatesScreenState();
}

class _IsolatesScreenState extends State<IsolatesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/gifs/loading.gif'),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Task 1'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Task 2'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Task 3'),
            ),
          ],
        ),
      ),
    ));
  }
}
/// End of the Isolates Screen \\\