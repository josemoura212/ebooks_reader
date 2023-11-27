import 'package:ebooks_reader/app/core/ui/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const nameRoute = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        elevation: 8,
        shadowColor: context.primaryColor,
      ),
      body: Container(),
    );
  }
}
