import 'package:flutter/material.dart';
import 'package:flutter_tutorial/pages/chart_page.dart';
import 'package:flutter_tutorial/pages/crud_page.dart';
import 'package:flutter_tutorial/pages/form_page.dart';
import 'package:flutter_tutorial/pages/home_page.dart';
import 'package:flutter_tutorial/pages/location_page.dart';
import 'package:flutter_tutorial/pages/media_page.dart';
import 'package:flutter_tutorial/pages/menu_page.dart';
import 'package:flutter_tutorial/pages/pdf_page.dart';
import 'package:flutter_tutorial/pages/signature_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tutorial',
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/menu': (context) => const MenuPage(),
        '/form': (context) => const FormPage(),
        '/media': (context) => const MediaPage(),
        '/crud': (context) => const CRUDPage(),
        '/location': (context) => const LocationPage(),
        '/chart': (context) => const ChartPage(),
        '/signature': (context) => const SignaturePage(),
        '/pdf': (context) => const PDFPage(),
        '/qrcode': (context) => const FormPage(),
      },
      initialRoute: '/',
    );
  }
}
