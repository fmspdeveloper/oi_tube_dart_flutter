import 'package:flutter/material.dart';
import 'controllers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _navegarPagina() {
    Navigator.pushNamed(context, "segunda-pagina");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(child: Text("home"),),
      bottomNavigationBar: CustomNavigatorbar(),
    );
  }
}

