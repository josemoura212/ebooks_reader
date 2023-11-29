import 'package:ebooks_reader/app/features/reader/reader_controller.dart';
import 'package:flutter/material.dart';

class ReaderPage extends StatefulWidget {
  const ReaderPage({super.key});
  static const nameRoute = "/reader";

  @override
  State<ReaderPage> createState() => _ReaderPageState();
}

class _ReaderPageState extends State<ReaderPage> {
  final _controller = ReaderController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reader Page'),
      ),
      body: Container(),
    );
  }
}
