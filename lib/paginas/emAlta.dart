import 'package:flutter/material.dart';

import '../controllers.dart';



class emAlta extends StatefulWidget {
  const emAlta({super.key});

  @override
  State<emAlta> createState() => _emAltaState();
}

class _emAltaState extends State<emAlta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(child: Text("Em alta"),),
      bottomNavigationBar: CustomNavigatorbar(),
    );
  }
}

