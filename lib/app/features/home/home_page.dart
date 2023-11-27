import 'package:ebooks_reader/app/core/ui/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const nameRoute = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Page',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 8,
        shadowColor: context.primaryColor,
        backgroundColor: const Color.fromARGB(255, 13, 13, 25),
      ),
      body: Container(),
    );
  }
}
