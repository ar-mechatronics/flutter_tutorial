import 'package:flutter/material.dart';

class CRUDPage extends StatelessWidget {
  const CRUDPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Wrap(
            spacing: 8,
            children: [
              ActionChip(
                label: const Text('Create'),
                onPressed: () {},
              ),
              ActionChip(
                label: const Text('Read'),
                onPressed: () {},
              ),
              ActionChip(
                label: const Text('Update'),
                onPressed: () {},
              ),
              ActionChip(
                label: const Text('Delete'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
