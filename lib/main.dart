import 'package:chat/package.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Test());
}

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(221, 173, 144, 144),
        body: Center(
          child: MyHomePage(
            height: 200,
            width: 300,
            title: "title",
            frontText: Text("Front"),
            rearText: Text("Rear"),
            cartNumber: 123456789101112,
            banktype: BankType.meli,
          ),
        ),
      ),
    );
  }
}
