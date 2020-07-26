import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/testaudio.dart';
import 'package:provider/provider.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

import 'audio_logic.dart';

void main() {
  runApp(MyApp());
}
//void main() {
//  runApp(MaterialApp(home: ExampleApp()));
//}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainTabView(),
    );
  }
}

class MainTabView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MainTabState();
  }
}

class MainTabState extends State<MainTabView>{
  AudioPlayer advancedPlayer = AudioPlayer();
  String localFilePath;


  List<SongInfo> songs = [];

  @override
  void initState() {
    pickAudio();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: "ALBUMS",
              ),
              Tab(
                text: "ARTISTS",
              ),
              Tab(
                text: "PODCASTS",
              ),
            ],
          ),
          title: Text(
            'Browse',
            style: TextStyle(fontSize: 30),
          ),
        ),
        backgroundColor: Colors.white,
        body: TabBarView(
          children: [
            Column(
              children: <Widget>[
                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 15,
                    itemBuilder: (BuildContext context, int index) => Container(
                      height: 0,
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.1,
                          height: MediaQuery.of(context).size.width*0.1,
                          child: Stack(
                            children: <Widget>[
                              Image(image: AssetImage("assets/images/alogo.png")),
                              Container(height: 50,width: 50,color: Colors.red,),
                              BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 6),
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100.withOpacity(0.2),
                                    )
                                ),
                              ),
                            ],
                          ),

                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                  child: Align(child: Text("Playlist",style: TextStyle(fontSize: 30),textAlign: TextAlign.left,),alignment: Alignment.centerLeft,),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: songs.length,
                    itemBuilder: (ctx, inti) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.account_balance),
                                Container(
                                  child: Expanded(
                                    child: GestureDetector(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => ExampleApp(text: songs[inti].filePath,)));
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Container(child: Text(songs[inti].displayName,style: TextStyle(fontSize: 18),maxLines: 1),alignment: Alignment.centerLeft,),
                                      Container(child: Text(songs[inti].album,style: TextStyle(fontSize: 15,),maxLines: 1,),alignment: Alignment.centerLeft,),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(songs[inti].duration),
                                ),
                                Icon(Icons.favorite_border),
                              ],
                            ),
                            Divider(),
                          ],
                        ),
                      ) ;
                    },
                  ),
                ),
              ],
            ),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }

  void pickAudio() async{

    final FlutterAudioQuery audioQuery = FlutterAudioQuery();
    /// getting all songs available on device storage
    songs = await audioQuery.getSongs();
    setState(() {
      for (var i in songs){
//      if(i.albumArtwork != null)
        var c = songs.length;
        print("This is -> $c");
      }

    });
  }
}
