import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:tiktok_favorite_gesture/tiktok_favorite_gesture.dart';

import 'home.dart';

class PrincipalApp extends StatefulWidget {
  @override
  State<PrincipalApp> createState() => _PrincipalAppState();
}

class _PrincipalAppState extends State<PrincipalApp> {
  int _paginaActual = 0;
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: botonesFooter(),
      body: getPaginas(),
    );
  }

  Widget getPaginas() {
    return IndexedStack(
      index: activeTab,
      children: [
        PaginaPrincipal(),
        Center(
          child: Text(
            "Biblioteca",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            "Busqueda",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            "Configuracion",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget botonesFooter() {
    List items = [
      FeatherIcons.home,
      FeatherIcons.search,
      Icons.favorite,
      FeatherIcons.user,
    ];

    return Container(
      height: 80,
      decoration: BoxDecoration(color: Colors.black26), //cambiar a negro
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            return IconButton(
                onPressed: () {
                  setState(() {
                    activeTab = index;
                  });
                },
                icon: Icon(
                  items[index],
                  color: activeTab == index ? Colors.grey : Colors.white,
                ));
          }),
        ),
      ),
    );
  }
}
