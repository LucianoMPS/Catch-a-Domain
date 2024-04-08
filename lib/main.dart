import 'package:dominio_project/view/index_dominio.dart';
import 'package:dominio_project/view/list_dominio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App",
      initialRoute: "/",
      routes: {
        '/': (context) => const IndexDominio(),
        '/list' : (context) => const ListDominio(),
      },
    );
  }
}
