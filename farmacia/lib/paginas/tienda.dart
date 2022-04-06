import 'package:flutter/material.dart';

class Tienda extends StatefulWidget {
  final dynamic song;
  const Tienda({Key? key, this.song}) : super(key: key);

  @override
  State<Tienda> createState() => _TiendaState();
}

class _TiendaState extends State<Tienda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
    );
  }
}
