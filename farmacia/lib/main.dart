import 'package:farmacia/paginas/principal.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Farmacia());
}

class Farmacia extends StatelessWidget {
  const Farmacia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PrincipalApp(),
    );
  }
}
