import 'package:flutter/material.dart';

class SillasDetalle extends StatefulWidget {
  final String title;
  final String description;
  final String img;
  //final String songUrl;

  const SillasDetalle(
      {Key? key,
      required this.title,
      required this.description,
      required this.img,
     // required this.songUrl
      })
      : super(key: key);

  @override
  State<SillasDetalle> createState() => _SillasDetalleState();
}

class _SillasDetalleState extends State<SillasDetalle> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
