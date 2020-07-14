import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "ALBUMS",),
                Tab(text: "ARTISTS",),
                Tab(text: "PODCASTS",),
              ],
            ),
            title: Text('Browse',style: TextStyle(fontSize: 30),),
          ),
          body: TabBarView(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(

                      scrollDirection: Axis.horizontal,
                      itemCount: 15,
                      itemBuilder: (BuildContext context, int index) => Container(
                        height: 0,
                        width: 150,
                        child: Card(
                          elevation: 10,
                          child: Center(child: Text('Album')),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Demo Headline 2',
                    style: TextStyle(fontSize: 18),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (ctx,int){
                        return Card(
                          child: ListTile(
                              title: Text('Motivation $int'),
                              subtitle: Text('this is a description of the motivation')),
                        );
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
      ),
    );
  }
}