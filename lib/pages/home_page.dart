import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Menu'),
            leading: const Icon(Icons.widgets),
            onTap: () {
              Navigator.pushNamed(context, '/menu');
            },
          ),
          ListTile(
            title: const Text('Form'),
            leading: const Icon(Icons.list_alt),
            onTap: () {
              Navigator.pushNamed(context, '/form');
            },
          ),
          ListTile(
            title: const Text('Media'),
            leading: const Icon(Icons.library_music),
            onTap: () {
              Navigator.pushNamed(context, '/media');
            },
          ),
          ListTile(
            title: const Text('CRUD'),
            leading: const Icon(Icons.storage),
            onTap: () {
              Navigator.pushNamed(context, '/crud');
            },
          ),
          ListTile(
            title: const Text('Location'),
            leading: const Icon(Icons.location_on),
            onTap: () {
              Navigator.pushNamed(context, '/location');
            },
          ),
          ListTile(
            title: const Text('Chart'),
            leading: const Icon(Icons.pie_chart),
            onTap: () {
              Navigator.pushNamed(context, '/chart');
            },
          ),
          ListTile(
            title: const Text('Signature'),
            leading: const Icon(Icons.border_color),
            onTap: () {
              Navigator.pushNamed(context, '/signature');
            },
          ),
          ListTile(
            title: const Text('PDF'),
            leading: const Icon(Icons.picture_as_pdf),
            onTap: () {
              Navigator.pushNamed(context, '/pdf');
            },
          ),
          ListTile(
            title: const Text('QR Code'),
            leading: const Icon(Icons.qr_code),
            onTap: () {
              Navigator.pushNamed(context, '/qrcode');
            },
          ),
        ],
      ),
    );
  }
}
