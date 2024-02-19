import 'package:flutter/material.dart';

class QRCodePage extends StatelessWidget {
  const QRCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR code'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [],
      ),
    );
  }
}
