part of '../home_page.dart';

class _HomeAppBar extends SliverAppBar {
  const _HomeAppBar()
      : super(
            expandedHeight: 100,
            collapsedHeight: 100,
            elevation: 0,
            flexibleSpace: const _FlexibleSpace());
}

class _FlexibleSpace extends StatelessWidget {
  const _FlexibleSpace();
  @override
  Widget build(BuildContext context) {
    final outLineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: Colors.grey[200]!),
    );
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 98, 101, 110),
      centerTitle: true,
      title: const Padding(
        padding: EdgeInsets.only(bottom: 20.0),
        child: Text("E-Books Reader"),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        )
      ],
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
                  onChanged: (value) {},
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
