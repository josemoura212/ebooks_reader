import 'package:ebooks_reader/app/core/helpers/debouncer.dart';
import 'package:ebooks_reader/app/core/ui/extensions/size_screen_extensions.dart';
import 'package:ebooks_reader/app/core/ui/extensions/theme_extension.dart';
import 'package:ebooks_reader/app/features/home/home_controller.dart';
import 'package:ebooks_reader/app/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
part 'widgets/home_appbar.dart';
part 'widgets/home_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const nameRoute = "/";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _controller.getBookFavorite();
      await _controller.getAllBooks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            _HomeAppBar(_controller),
          ];
        },
        body: _HomeTab(_controller),
      ),
    );
  }
}
