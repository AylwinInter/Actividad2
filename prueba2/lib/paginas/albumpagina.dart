import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spotifyclone/paginas/detalleCanciones.dart';
import 'package:spotifyclone/paginas/home.dart';
import 'package:audioplayers/audioplayers.dart';
import '../constantes/const.dart';

class AlbumPagina extends StatefulWidget {
  final dynamic song;

  const AlbumPagina({Key? key, this.song}) : super(key: key);

  @override
  State<AlbumPagina> createState() => _AlbumPaginaState();
}

class _AlbumPaginaState extends State<AlbumPagina> {
  // audio player here
  late AudioPlayer advancedPlayer;
  late AudioCache audioCache;
  bool isPlaying = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlayer();
  }

  initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);
    //playSound(widget.songUrl);
  }

  playSound(localPath) async {
    await audioCache.play(localPath);
  }

  stopSound(localPath) async {
    Uri audioFile = await audioCache.load(localPath);
    await advancedPlayer.setUrl(audioFile.path);
    advancedPlayer.stop();
  }

  seekSound() async {
    //Uri audioFile = await audioCache.load(widget.songUrl);
    //await advancedPlayer.setUrl(audioFile.path); ni se como utilizar pero lo averiguare
    advancedPlayer.seek(Duration(milliseconds: 2000));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //stopSound(widget.songUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Reproductor(),
    );
  }

  Widget Reproductor() {
    var tamanio = MediaQuery.of(context).size;
    var size = MediaQuery.of(context).size;
    List songAlbums = widget.song['songs'];
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
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                        image: AssetImage(widget.song['img']),
                        fit: BoxFit.scaleDown)),
              ),
              SizedBox(
                height: 9,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
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
                Text(
                  widget.song['title'],
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
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
              padding: const EdgeInsets.only(left: 30, top: 200),
              child: Row(
                children: List.generate(animals.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 30, top: 200),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: CancionesDetalle(
                                    title: animals[index]['title'],
                                    description: animals[index]['description'],
                                    img: animals[index]['img'],
                                    songUrl: animals[index]['song_url'],
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
//reproductor

          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 20),
                      child: Container(
                        width: size.width - 100,
                        height: size.width - 100,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 50,
                              spreadRadius: 5,
                              offset: Offset(-10, 40))
                        ], borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 20),
                      child: Container(
                        width: size.width - 60,
                        height: size.width - 60,
                        /*decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.img), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20)),pendiente */
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    width: size.width - 80,
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          AntDesign.addfolder,
                          color: Colors.white,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            /*Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),*/
                            /*Container(
                        width: 150,
                        child: Text(
                          widget.description,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white.withOpacity(0.5)),
                        ),
                      )*/
                          ],
                        ),
                        Icon(
                          Feather.more_vertical,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                /*Slider(
              activeColor: Colors.green,
              value: _currentSliderValue,
              min: 0,
              max: 200,
              onChanged: (value) {
                setState(() {
                  _currentSliderValue = value;
                });
                seekSound();
              }),*/
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "1:50",
                        style: TextStyle(color: Colors.white.withOpacity(0.5)),
                      ),
                      Text(
                        "4:68",
                        style: TextStyle(color: Colors.white.withOpacity(0.5)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Feather.tv,
                      color: Colors.green,
                      size: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(
                        "Chromecast is ready",
                        style: TextStyle(color: Colors.green),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),

          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                IconButton(
                    icon: Icon(
                      Feather.more_vertical,
                      color: Colors.white,
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

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Container(
                  width: size.width - 100,
                  height: size.width - 100,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 50,
                        spreadRadius: 5,
                        offset: Offset(-10, 40))
                  ], borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Container(
                  width: size.width - 60,
                  height: size.width - 60,
                  /*decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.img), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20)),*/
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              width: size.width - 80,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    AntDesign.addfolder,
                    color: Colors.white,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      /*Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),*/
                      /*Container(
                        width: 150,
                        child: Text(
                          widget.description,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white.withOpacity(0.5)),
                        ),
                      )*/
                    ],
                  ),
                  Icon(
                    Feather.more_vertical,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          /*Slider(
              activeColor: Colors.green,
              value: _currentSliderValue,
              min: 0,
              max: 200,
              onChanged: (value) {
                setState(() {
                  _currentSliderValue = value;
                });
                seekSound();
              }),*/
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "1:50",
                  style: TextStyle(color: Colors.white.withOpacity(0.5)),
                ),
                Text(
                  "4:68",
                  style: TextStyle(color: Colors.white.withOpacity(0.5)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Feather.tv,
                color: Colors.green,
                size: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Text(
                  "Chromecast is ready",
                  style: TextStyle(color: Colors.green),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
