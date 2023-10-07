import 'package:flutter/material.dart';




class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.grey),
      backgroundColor: Colors.white,
      title: GestureDetector(
        onTap: () {
          print("clicou no logo");
        },
        child: Image.asset(
          "images/youtube.png",
          fit: BoxFit.contain,
          width: 120,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            // Ação do ícone aqui
          },
          icon: Icon(Icons.emergency_recording),
        ),
        IconButton(
          onPressed: () {
            // Ação do ícone aqui
          },
          icon: Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {
            // Ação do ícone aqui
          },
          icon: Icon(Icons.account_box),
        ),
      ],
    );
  }
}
