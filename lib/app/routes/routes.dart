import 'package:ebooks_reader/app/features/home/home_page.dart';
import 'package:ebooks_reader/app/features/home/home_route.dart';
import 'package:flutter/material.dart';

sealed class Routes {
  static Route<dynamic> routes(RouteSettings settings) {
    WidgetBuilder builder;
    switch (settings.name) {
      case HomePage.nameRoute:
        builder = HomeRoute().page;
        break;
      default:
        throw Exception("Rota não encontrada");
    }

    return MaterialPageRoute(builder: builder, settings: settings);
  }
}
