import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: kamalov()
  ));
}

class kamalov extends StatefulWidget {
  const kamalov({super.key});

  @override
  State<kamalov> createState() => _kamalovState();
}

class _kamalovState extends State<kamalov> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Salom Aziz aka"),
      ),
    );
  }
}