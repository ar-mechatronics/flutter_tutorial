import 'package:flutter/material.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chart'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [],
      ),
    );
  }
}
