import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/player_vidget.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/foundation/constants.dart';

//void main() {
//  runApp(MaterialApp(home: ExampleApp()));
//}

class ExampleApp extends StatefulWidget {
  ExampleApp({@required this.text});
  String text = null;
  @override
  _ExampleAppState createState() => _ExampleAppState(localFilePath: text);
}

class _ExampleAppState extends State<ExampleApp> {
  _ExampleAppState({@required this.localFilePath});
  AudioCache audioCache = AudioCache();
  AudioPlayer advancedPlayer = AudioPlayer();
  String localFilePath= null;

  @override
  void initState() {
    super.initState();

    if (kIsWeb) {
      // Calls to Platform.isIOS fails on web
      return;
    }
    if (Platform.isIOS) {
      if (audioCache.fixedPlayer != null) {
        audioCache.fixedPlayer.startHeadlessService();
      }
      advancedPlayer.startHeadlessService();
    }
  }

//  Future _loadFile() {
//    setState(() {
//      localFilePath = "/storage/emulated/0/Ahsan_Songs/Yeh Dosti_320(MyMp3Song).mp3";
//    });
//  }

  Widget localFile() {
    return _Tab(children: [
      PlayerWidget(
        url: localFilePath,
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<Duration>.value(
            initialData: Duration(),
            value: advancedPlayer.onAudioPositionChanged),
      ],
      child: DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: 'Local File'),
              ],
            ),
            title: Text('audioplayers Example'),
          ),
          body: TabBarView(
            children: [
              localFile(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  final List<Widget> children;

  const _Tab({Key key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: children
                .map((w) => Container(child: w, padding: EdgeInsets.all(6.0)))
                .toList(),
          ),
        ),
      ),
    );
  }
}