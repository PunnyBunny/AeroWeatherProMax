import 'package:flutter/material.dart';

class RaspPage extends StatelessWidget {
  const RaspPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Page'),
      ),
      body: Center(
        child: Text('Map Page'),
      ),
    );
  }
}