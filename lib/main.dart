import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

import 'audio_logic.dart';

void main() {
  runApp(MyApp());
}

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
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: <Widget>[
                              Container(child: RaisedButton(child: Icon(Icons.favorite),onPressed: pickAudio,),alignment: Alignment.center,),
                              Container(
                                alignment: Alignment.bottomLeft,
                                child: Container(height: 50,width: 50,color: Colors.red,),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(child: Text("Playlist",style: TextStyle(fontSize: 30),textAlign: TextAlign.left,),alignment: Alignment.centerLeft,),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0,0,20,0),
                    child: ListView.builder(
                      itemCount: songs.length,
                      itemBuilder: (ctx, int) {
                        return Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.account_balance),
                                Spacer(flex: 1,),
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      Container(child: Text(songs[int].displayName,style: TextStyle(fontSize: 18),maxLines: 1),alignment: Alignment.centerLeft,),
//                                      Container(child: Text("songs[int].albumArtwork",style: TextStyle(fontSize: 15,),maxLines: 1,),alignment: Alignment.centerLeft,),
                                    ],
                                  ),
                                  width: 80,
                                ),
                                Spacer(flex: 3,),
                                Text("4:02"),
                                Spacer(),
                                Icon(Icons.favorite_border),
                              ],
                            ),
                            Divider(),
                          ],
                        ) ;
                      },
                    ),
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
