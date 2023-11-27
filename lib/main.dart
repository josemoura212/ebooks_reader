import 'package:asuka/asuka.dart';
import 'package:ebooks_reader/app/core/ui/ui_config.dart';
import 'package:ebooks_reader/app/features/home/home_page.dart';
import 'package:ebooks_reader/app/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const EbooksReaderApp());
}

class EbooksReaderApp extends StatelessWidget {
  const EbooksReaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: Asuka.builder,
      title: UiConfig.title,
      theme: UiConfig.theme,
      onGenerateRoute: Routes.routes,
      initialRoute: HomePage.nameRoute,
      navigatorObservers: [
        Asuka.asukaHeroController,
      ],
    );
  }
}
