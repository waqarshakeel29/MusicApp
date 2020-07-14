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
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
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
                                  Container(child: Icon(Icons.favorite),alignment: Alignment.center,),
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
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (ctx, int) {
                          return Column(
                            children: <Widget>[
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Icon(Icons.account_balance),
                                  Column(
                                    children: <Widget>[
                                      Text("Hello"),
                                      Text("sub"),
                                    ],
                                  ),
                                  Text("4:02"),
                                  Icon(Icons.favorite_border),
                                ],
                              ),
                              Divider(),
                            ],
                          ) ;
                        },
                      ),
                    ),
                  ],
                ),
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
