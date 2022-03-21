import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'home.dart';

class Principal extends StatefulWidget {
  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color.fromARGB(255, 114, 106, 106), // color de pantalla inicial
      bottomNavigationBar: BotonesFooter(),
      body: getPaginas(),
    );
  }

  Widget BotonesFooter() {
    List item = [
      FeatherIcons.home,
      FeatherIcons.shoppingCart,
      FeatherIcons.user
    ];
    return Container(
      height: 80,
      decoration: BoxDecoration(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(item.length, (index) {
            return IconButton(
              onPressed: () {
                setState(() {
                  activeTab = index;
                });
              },
              icon: Icon(
                item[index],
                color: activeTab == index
                    ? Colors.blue
                    : Color.fromARGB(255, 7, 62, 107),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget getPaginas() {
    return IndexedStack(
      index: activeTab,
      children: [
        PaginaPrincipal(),
      ],
    );
  }
}
