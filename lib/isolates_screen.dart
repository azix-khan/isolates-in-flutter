import 'dart:isolate';
import 'package:flutter/material.dart';

class IsolatesScreen extends StatefulWidget {
  const IsolatesScreen({super.key});

  @override
  State<IsolatesScreen> createState() => _IsolatesScreenState();
}

class _IsolatesScreenState extends State<IsolatesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/gifs/loading.gif'),
              // with async method - that bolcking UI
              ElevatedButton(
                onPressed: () async {
                  var total = await complexTask1();
                  debugPrint("Result 1: $total");
                },
                child: const Text('Task 1'),
              ),
              // with isolates method
              ElevatedButton(
                onPressed: () {
                  // spawn means creating a new instance
                  final receivePort = ReceivePort();
                  Isolate.spawn(complexTask2, receivePort.sendPort);
                  // once isolates created we have to use recieve port to listn
                  receivePort.listen((total) {
                    debugPrint("Result 2: $total");
                  });
                },
                child: const Text('Task 2'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<double> complexTask1() async {
    var total = 0.0;
    for (var i = 0; i < 1000000000; i++) {
      total += i;
    }
    return total;
  }
}

/// --- End of the Isolates Screen --- \\\

// to use isolates , need to know that write that method outside any class
complexTask2(SendPort sendport) {
  var total = 0.0;
  for (var i = 0; i < 1000000000; i++) {
    total += i;
  }
  // cannot return directly
  // return total;
  // have to send data to a particular port
  sendport.send(total);
}
