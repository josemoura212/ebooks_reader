part of '../home_page.dart';

class _HomeTab extends StatelessWidget {
  final HomeController _controller;
  const _HomeTab(this._controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _HomeHeader(_controller),
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: _HomeBookGrid(_controller),
          ),
        ),
      ],
    );
  }
}

class _HomeHeader extends StatelessWidget {
  final HomeController _controller;
  const _HomeHeader(this._controller);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          TextButton(
            onPressed: () {
              _controller.selectType(HomeType.books);
            },
            child: const Text(
              "Livros",
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(width: 15),
          TextButton(
            onPressed: () {
              _controller.selectType(HomeType.favorites);
            },
            child: const Text(
              "Favoritos",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeBookGrid extends StatelessWidget {
  final HomeController _controller;
  const _HomeBookGrid(this._controller);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        Observer(builder: (_) {
          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final book = _controller.bookList[index];
                return _HomeBookGridItemWidget(book, _controller, index);
              },
              childCount: _controller.bookList.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
          );
        }),
      ],
    );
  }
}

class _HomeBookGridItemWidget extends StatelessWidget {
  final BookModel book;
  final HomeController _controller;
  final int index;
  const _HomeBookGridItemWidget(this.book, this._controller, this.index);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 4,
          color: Colors.white,
          margin:
              const EdgeInsets.only(top: 100, left: 10, right: 10, bottom: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SizedBox.expand(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 110, left: 10, right: 10, bottom: 10),
              child: Column(
                children: [
                  Text(
                    book.title,
                    style: context.textTheme.titleSmall,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    book.author,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 200,
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey[300]!, width: 3),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  Navigator.pushNamed(context, '/reader', arguments: book);
                },
                child: Image.network(
                  book.coverUrl,
                  height: 194,
                  width: 134,
                  fit: BoxFit.fill,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;

                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, child, stackTrace) {
                    return Container(
                      color: Colors.white,
                      height: 194,
                      width: 134,
                      child: const Center(
                        child: Text("Erro ao carregar imagem"),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 5,
          right: 30,
          child: IconButton(
            onPressed: () {
              _controller.checkBookFavorite(book, index);
            },
            icon: Icon(
              book.favorite ? Icons.favorite : Icons.favorite_outline,
              size: 45,
              color: Colors.red,
            ),
          ),
        )
      ],
    );
  }
}
