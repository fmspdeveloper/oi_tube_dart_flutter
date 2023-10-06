import 'package:flutter/material.dart';
import 'package:oi_tube/paginas/emAlta.dart';

import 'home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "home": (context) => HomePage(),
      "em-alta": (context) => emAlta(),
    },
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}
