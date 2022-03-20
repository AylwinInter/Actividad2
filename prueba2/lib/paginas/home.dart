import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:page_transition/page_transition.dart';

import '../constantes/const.dart';
import 'package:spotifyclone/paginas/albumpagina.dart';

class PaginaPrincipal extends StatefulWidget {
  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  int activoMenu1 = 0;
  int activoMenu2 = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: mostrarAppBar(),
      ),
      body: bodyAppSpf(),
    );
  }

  Widget mostrarAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Explorar",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Icon(Entypo.list),
          ],
        ),
      ),
    );
  }

  Widget bodyAppSpf() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: Row(
                      children: List.generate(song_type_1.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            activoMenu1 = index;
                          });
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              song_type_1[index],
                              style: TextStyle(
                                  fontSize: 15,
                                  color: activoMenu1 == index
                                      ? Colors.green
                                      : Colors.grey,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            activoMenu1 == index
                                ? Container(
                                    width: 10,
                                    height: 3,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(5)),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                    );
                  })),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                  children: List.generate(animals.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              alignment: Alignment.bottomCenter,
                              child: AlbumPagina(
                                song: animals[index],
                              ),
                              type: PageTransitionType.scale));
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 310,
                          height: 110,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(animals[index]['img']),
                                  fit: BoxFit.cover),
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                );
              })),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, top: 20),
                child: Row(
                    children: List.generate(song_type_2.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          activoMenu2 = index;
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            song_type_2[index],
                            style: TextStyle(
                                fontSize: 15,
                                color: activoMenu2 == index
                                    ? Colors.green
                                    : Colors.grey,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          activoMenu2 == index
                              ? Container(
                                  width: 10,
                                  height: 3,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(5)),
                                )
                              : Container()
                        ],
                      ),
                    ),
                  );
                })),
              ),
            ),
          ]),
          SizedBox(
            height: 10,
          ),

//segundo bloque

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 1),
              child: Row(
                  children: List.generate(animals2.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 1),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              alignment: Alignment.bottomCenter,
                              child: AlbumPagina(
                                song: animals2[index],
                              ),
                              type: PageTransitionType.scale));
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(animals2[index]['img']),
                                  fit: BoxFit.cover),
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          animals[index]['title'],
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 100,
                          child: Text(
                            animals[index]['description'],
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 8,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              })),
            ),
          ),

          SizedBox(
            height: 10,
          ),

//Titulo tercera parte

          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, top: 20),
                child: Row(
                    children: List.generate(song_type_2.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          activoMenu2 = index;
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            song_type_2[index],
                            style: TextStyle(
                                fontSize: 15,
                                color: activoMenu2 == index
                                    ? Colors.green
                                    : Colors.grey,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          activoMenu2 == index
                              ? Container(
                                  width: 10,
                                  height: 3,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(5)),
                                )
                              : Container()
                        ],
                      ),
                    ),
                  );
                })),
              ),
            ),
          ]),

          //Tercera parte

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                  children: List.generate(animals2.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              alignment: Alignment.bottomCenter,
                              child: AlbumPagina(
                                song: animals2[index],
                              ),
                              type: PageTransitionType.scale));
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 150,
                          height: 300,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(animals2[index]['img']),
                                  fit: BoxFit.cover),
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          animals[index]['title'],
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 100,
                          child: Text(
                            animals[index]['description'],
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 8,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              })),
            ),
          ),
        ],
      ),
    );
  }
}
