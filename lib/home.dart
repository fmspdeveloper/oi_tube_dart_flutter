import 'package:flutter/material.dart';
import 'CustomSearchDelegate.dart';
import 'paginas/EmAlta.dart';
import 'paginas/Inicio.dart';
import 'paginas/Biblioteca.dart';
import 'paginas/Inscricao.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        title: GestureDetector(
          onTap: () {
            //print("clicou no logo");
          },
          child: Image.asset(
            "images/youtube.png",
            fit: BoxFit.contain,
            width: 120,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              String? res = await showSearch(
                  context: context, delegate: CustomSearchDelegate());
              setState(() {
                _resultado = res!;
              });

              print("resultado: digitado " + res!);
            },
            icon: const Icon(Icons.search),
          ),
          /*
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
          icon: Icon(Icons.account_box),
        ), */
        ],
      ),
      body: Container(
        padding:const EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _indiceAtual,
          onTap: (indice) {
            setState(() {
              _indiceAtual = indice;
            });
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.red,
          items: [
            const BottomNavigationBarItem(label: "Início", icon: Icon(Icons.home)),
            const BottomNavigationBarItem(
                label: "Em alta", icon: Icon(Icons.whatshot)),
            const BottomNavigationBarItem(
                label: "Inscrições", icon: Icon(Icons.subscriptions)),
            const BottomNavigationBarItem(
                label: "Biblioteca", icon: Icon(Icons.folder)),
          ]),
    );
  }
}
