part of '../home_page.dart';

class _HomeTab extends StatelessWidget {
  final HomeController _controller;
  const _HomeTab(this._controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _HomeHeader(),
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
  const _HomeHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Livros",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 15),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Favoritos",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.view_compact),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.view_headline),
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
                return _HomeBookGridItemWidget(book, _controller);
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
  const _HomeBookGridItemWidget(this.book, this._controller);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 8,
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
              child: Image.network(
                book.coverUrl,
                height: 194,
                width: 134,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
        Observer(builder: (_) {
          return Positioned(
            top: 5,
            right: 30,
            child: IconButton(
              onPressed: () {
                _controller.addBookFavorite(book);
              },
              icon: Icon(
                _controller.bookFavoriteList.contains(book.id.toString())
                    ? Icons.favorite
                    : Icons.favorite_outline,
                size: 45,
                color: Colors.red,
              ),
            ),
          );
        })
      ],
    );
  }
}

class _HomeBookList extends StatelessWidget {
  const _HomeBookList();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return const _HomeBookListItemWidget();
            },
            childCount: 10,
          ),
        ),
      ],
    );
  }
}

class _HomeBookListItemWidget extends StatelessWidget {
  const _HomeBookListItemWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 70),
            width: 1.sw,
            height: 200.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 120),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Titulo",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Autor",
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.favorite_border,
              size: 60,
              color: Colors.red,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            height: 180,
            width: 130,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.transparent, width: 1),
              borderRadius: BorderRadius.circular(100),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                "https://www.gutenberg.org/cache/epub/72134/pg72134.cover.medium.jpg",
                height: 145,
                width: 120,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
