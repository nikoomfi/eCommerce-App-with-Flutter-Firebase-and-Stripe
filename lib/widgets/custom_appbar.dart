import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppbar({
    Key? key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Center(
        child: Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      iconTheme: IconThemeData(color: Colors.black),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.favorite))],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}
