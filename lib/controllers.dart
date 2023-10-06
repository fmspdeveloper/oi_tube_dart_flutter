import 'package:flutter/material.dart';
import 'package:oi_tube/paginas/emAlta.dart';

import 'home.dart';

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

class CustomNavigatorbar extends StatefulWidget {
  const CustomNavigatorbar({super.key});

  @override
  State<CustomNavigatorbar> createState() => _CustomNavigatorbarState();
}

class _CustomNavigatorbarState extends State<CustomNavigatorbar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> paginas = [
      HomePage(),
      emAlta(),
    ];
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (int index) {
        setState(() {
          selectedIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.red,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.local_fire_department,
          ),
          label: 'Em alta',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.play_circle_filled,
          ),
          label: 'Inscrições',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.folder,
          ),
          label: 'Biblioteca',
        ),
      ],
    );
  }
}
