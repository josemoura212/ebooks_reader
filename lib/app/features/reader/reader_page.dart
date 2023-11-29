import 'package:ebooks_reader/app/features/reader/reader_controller.dart';
import 'package:ebooks_reader/app/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vocsy_epub_viewer/epub_viewer.dart';

class ReaderPage extends StatefulWidget {
  final BookModel book;
  const ReaderPage({super.key, required this.book});
  static const nameRoute = "/reader";

  @override
  State<ReaderPage> createState() => _ReaderPageState();
}

class _ReaderPageState extends State<ReaderPage> {
  final _controller = ReaderController();
  String filePath = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _controller.download(widget.book.downloadUrl, widget.book.title);
      filePath = _controller.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    final book = widget.book;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Reader Page'),
      ),
      body: Column(
        children: [
          _ReaderHeader(book: book),
          const SizedBox(height: 45),
          Observer(
            builder: (_) {
              return ElevatedButton(
                onPressed: () async {
                  if (filePath == "") {
                    await _controller.download(book.downloadUrl, book.title);
                  } else {
                    VocsyEpub.setConfig(
                      themeColor: Colors.teal,
                      identifier: book.title,
                      scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
                      allowSharing: true,
                      enableTts: true,
                    );
                  }
                  _controller.loading
                      ? Container()
                      : VocsyEpub.open(_controller.path);
                },
                child: _controller.loading
                    ? const CircularProgressIndicator()
                    : const Text(
                        "Ler livro",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ReaderHeader extends StatelessWidget {
  final BookModel book;
  const _ReaderHeader({required this.book});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      color: Colors.grey[500],
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey[400]!, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  book.coverUrl,
                  height: 200,
                  width: 130,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                children: [
                  Text(
                    book.title,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    book.author,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
