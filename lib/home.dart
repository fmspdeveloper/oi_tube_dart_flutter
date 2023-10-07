import 'package:flutter/material.dart';
import 'controllers.dart';
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

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [Inicio(), EmAlta(), Inscricao(), Biblioteca()];

    return Scaffold(
      appBar: CustomAppBar(),
      body: telas[_indiceAtual],
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
            BottomNavigationBarItem(label: "Início", icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: "Em alta", icon: Icon(Icons.whatshot)),
            BottomNavigationBarItem(
                label: "Inscrições", icon: Icon(Icons.subscriptions)),
            BottomNavigationBarItem(
                label: "Biblioteca", icon: Icon(Icons.folder)),
          ]),
    );
  }
}
