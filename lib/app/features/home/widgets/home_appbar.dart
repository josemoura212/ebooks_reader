part of '../home_page.dart';

class _HomeAppBar extends SliverAppBar {
  // ignore: unused_field
  final HomeController _controller;
  _HomeAppBar(this._controller)
      : super(
            expandedHeight: 100,
            collapsedHeight: 100,
            elevation: 0,
            flexibleSpace: _FlexibleSpace(_controller));
}

class _FlexibleSpace extends StatelessWidget {
  final HomeController _controller;
  final _debouncer = Debouncer(milliseconds: 500);
  _FlexibleSpace(this._controller);
  @override
  Widget build(BuildContext context) {
    final outLineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: Colors.grey[200]!),
    );
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: const Padding(
        padding: EdgeInsets.only(bottom: 20.0),
        child: Text("E-Books Reader"),
      ),
      flexibleSpace: Stack(
        children: [
          Container(
            height: 110.h,
            color: const Color.fromARGB(255, 13, 13, 25),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: .9.sw,
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(30),
                child: TextFormField(
                  onChanged: (value) {
                    _debouncer.run(() {
                      _controller.filterBookByName(value);
                    });
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon:
                        const Icon(Icons.search, size: 25, color: Colors.grey),
                    border: outLineInputBorder,
                    enabledBorder: outLineInputBorder,
                    focusedBorder: outLineInputBorder,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
