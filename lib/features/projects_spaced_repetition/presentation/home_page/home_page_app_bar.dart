import 'package:flutter/material.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("AppMaking.co"),
      centerTitle: true,
      backgroundColor: Colors.green,
      leading: IconButton(onPressed: () => {}, icon: Icon(Icons.menu)),
      actions: [
        IconButton(onPressed: () => {}, icon: Icon(Icons.search)),
        IconButton(onPressed: () => {}, icon: Icon(Icons.more_vert)),
      ],
    );
  }


  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}