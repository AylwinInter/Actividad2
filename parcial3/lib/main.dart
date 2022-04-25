import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:parcial3/modelo/consumoApi.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const Parcial3());
}

class Parcial3 extends StatefulWidget {
  const Parcial3({Key? key}) : super(key: key);

  @override
  State<Parcial3> createState() => _Parcial3State();
}

class _Parcial3State extends State<Parcial3> {
  int activeTab = 0;
  int _paginaActual = 0;
  late Future<List<Consumo>> _ListaConsumo;
  Future<List<Consumo>> _getConsumo() async {
    final response = await http.get(Uri.parse(
        "https://api.giphy.com/v1/gifs/trending?api_key=bWrDFFlPGIDW598UrWGQxtZA8IGGZeAu&limit=25&rating=g"));

    String cuerpo;
    List<Consumo> lista = [];

    if (response.statusCode == 200) {
      print(response.body);
      cuerpo = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(cuerpo);
      for (var item in jsonData["data"]) {
        lista.add(Consumo(
          item["title"],
          item["images"]["downsized"]["url"],
        ));
      }
    } else {
      throw Exception("Falló la conexion");
    }
    return lista;
  }

  void initState() {
    super.initState();
    _ListaConsumo = _getConsumo();
  }

  @override
  Widget build(BuildContext context) {
    var futureBuilder = FutureBuilder(
      future: _ListaConsumo,
      builder: (context, snapshop) {
        if (snapshop.hasData) {
          return GridView.count(
            crossAxisCount: 2,
            children: _listadoConsumos(snapshop.data),
          );
        } else {
          print(snapshop.error);
          return Text("ERROR");
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    return MaterialApp(
      home: Scaffold(
          bottomNavigationBar: botonesFooter(),
          backgroundColor: Color.fromARGB(221, 56, 55, 55),
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 32, 32, 32),
            title: Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Consumiendo Gif",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.gif),
                ],
              ),
            ),
          ),
          body: futureBuilder),
    );
  }

  List<Widget> _listadoConsumos(data) {
    List<Widget> gif = [];
    for (var itempk in data) {
      gif.add(
        Card(
          elevation: 2.0,
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //Text(itempk.num),
              Expanded(
                  child: Image.network(
                itempk.url,
                fit: BoxFit.fill,
              )),
              /*Container(
                padding: EdgeInsets.all(8.0),
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(itempk.url), fit: BoxFit.fill,),
                ),
              ),*/
              /*Text(
                itempk.name,
                style: TextStyle(fontSize: 1),
              )*/
            ],
          ),
        ),
      );
    }
    return gif;
  }

  Widget getPaginas() {
    return IndexedStack(
      index: activeTab,
      children: [
        /*Center(
          child: Text(
            "Principal",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),*/
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
            "Confuguraciones",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget botonesFooter() {
    List items = [
      Icons.gif_box,
      Icons.account_box,
      Icons.gif_rounded,
      //FeatherIcons.shoppingBag,
      //FeatherIcons.settings
    ];

    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 32, 32, 32)), //cambiar a negro
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
