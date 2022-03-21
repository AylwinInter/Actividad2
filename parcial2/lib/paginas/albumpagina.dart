import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:parcial2/constantes/const.dart';

import 'detalleSillas.dart';

class CategoriaSillas extends StatefulWidget {
  final dynamic silla;
  final String title;
  final String description;
  final String img;

  const CategoriaSillas(
      {Key? key,
      this.silla,
      required this.title,
      required this.description,
      required this.img})
      : super(key: key);
  @override
  State<CategoriaSillas> createState() => _CategoriaSillasState();
}

class _CategoriaSillasState extends State<CategoriaSillas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Vista(),
    );
  }

  Widget Vista() {
    var tamanio = MediaQuery.of(context).size;
    //List songAlbums = widget.silla['songs'];
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Container(
                width: tamanio.width,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                        image: AssetImage(widget.silla['img']),
                        fit: BoxFit.scaleDown),
                    color: Color.fromARGB(255, 41, 41, 41)),
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 10, top: 200, left: 300),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(
                height: 9,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 40, top: 8, bottom: 8),
                      child: Text(
                        "Silla Guanaca  ",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 12, top: 8, bottom: 8),
                      child: Text(
                        "\$ 24.99",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 1, top: 8, bottom: 8),
                      child: Icon(
                        Icons.star,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 1, right: 1, top: 8, bottom: 8),
                      child: Icon(
                        Icons.star,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 1, right: 1, top: 8, bottom: 8),
                      child: Icon(
                        Icons.star,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 1, right: 5, top: 8, bottom: 8),
                      child: Icon(
                        Icons.star,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 1, top: 8, bottom: 8),
                      child: Icon(
                        Icons.star,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 1, top: 8, bottom: 8),
                      child: Text(
                        "200 Reviews",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 0, bottom: 8),
                      child: Text(
                        " Lorem ipsum dolor sit amet, consecteturn adipiscing jkkjihkh \n elit, sed do eiusmod tempor incididunt ut labore et dolore m \n aliqua.   Ut enim ad minim veniam, quis nostrud exercitation \n ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                        maxLines: 5,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 12,
                        top: 10,
                      ),
                      child: Icon(
                        Icons.circle,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 12,
                        top: 8,
                      ),
                      child: Icon(
                        Icons.circle,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 12,
                        top: 8,
                      ),
                      child: Icon(
                        Icons.circle,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 12,
                    bottom: 40,
                  ),
                  child: Column(
                    children: [
                      TextField(),
                      RaisedButton(
                        onPressed: () {},
                        child: Text("Comprar"),
                        color: Colors.blue,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 500,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 100),
              child: Row(
                children: List.generate(sillas.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 30, top: 100),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: SillasDetalle(
                                    title: sillas[index]['title'],
                                    description: sillas[index]['description'],
                                    img: sillas[index]['img'],
                                    //songUrl: sillas[index]['song_url'],
                                  ),
                                  type: PageTransitionType.scale));
                        },
                        child: Column(children: [
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: tamanio.width - 210,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [],
                            ),
                          )
                        ])),
                  );
                }),
              ),
            ),
          ),
          /*Padding(
            padding: const EdgeInsets.only(top: 400),
            child: Column(
                children: List.generate(songAlbums.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            alignment: Alignment.bottomCenter,
                            child: SillasDetalle(
                              title: widget.silla['title'],
                              description: widget.silla['description'],
                              img: widget.silla['img'],
                              //songUrl: widget.silla['song_url'],
                            ),
                            type: PageTransitionType.scale));
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: (tamanio.width - 60) * 0.77,
                        child: Text(
                          "${index}  " + songAlbums[index]['title'],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      /*Container(
                        width: (tamanio.width - 60) * 0.23,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              songAlbums[index]['duration'],
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.withOpacity(0.8),
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 16,
                              )),
                            )
                          ],
                        ),
                      ),*/
                    ],
                  ),
                ),
              );
            })),
          ),*/

          //BOTON PARA RETORNAR TIPO FLECHA
          ////////////////////////////////////
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                IconButton(
                    icon: Icon(
                      Feather.shopping_cart,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ),
          )
        ],
      ),
//safearea
    );
  }
}
