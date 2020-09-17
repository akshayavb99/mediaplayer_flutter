import 'package:flutter/material.dart';

class MyVideoList extends StatefulWidget {
  MyVideoList({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyVideoListState createState() => _MyVideoListState();
}

class _MyVideoListState extends State<MyVideoList> {


  List<String> vid_names =["Impressive Space Nebula",
                           "Lake Landscape",
                           "Dream Clouds",
                           "Milky Way Time-Lapse",
                           "Aurora",
                           "Dense Clouds in the Sky",
                           "Blooming White Flowers",
                           "Alps Time-lapse"];

  List<String> urls =["assets/videos/nebula.mp4",
                      "assets/videos/lake_landscape.mp4",
                      "assets/videos/dream_clouds.mp4",
                      "assets/videos/milky_way.mp4",
                      "assets/videos/aurora.mp4",
                      "assets/videos/dense_clouds.mp4",
                      "assets/videos/flowers.mp4",
                      "assets/videos/alps.mp4"];

  List<String> vid_img =["images/nebula.jpg", 
                         "images/lake_landscape.jpg", 
                         "images/dream_clouds.jpg",
                         "images/milky_way.jpg",
                         "images/aurora.jpg",
                         "images/dense_clouds.jpg",
                         "images/flowers.jpg",
                         "images/alps.jpg"];


@override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.5),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
          gradient: LinearGradient(
          colors: [Colors.deepPurple[800],Colors.purple[600],Colors.purple[300],Colors.blue[600],Colors.deepPurple[800]],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
                    )
                  ),
          child: Container(
                      margin: EdgeInsets.only(top: 125, bottom: 100),
                      height:10,
                      child: ListView.builder(
                      padding: EdgeInsets.all(10.0),
                      itemCount: vid_names.length,
                      itemBuilder: (BuildContext context,int index){ 
                        return InkWell(
                                        child: ListTile( 
                                          //leading: Icon(Icons.music_note), 
                                          leading: Image.asset("assets/${vid_img[index]}"),
                                          contentPadding: EdgeInsets.all(5.5),
                                          title:Text(
                                            "${vid_names[index]}",
                                            style: TextStyle(
                                              fontSize: 22.0,
                                            )
                                            ), 
                                        ),
                                        splashColor: Colors.deepPurple,
                                        onTap: () {
                                            print("Button tapped");
                                            print("Name of video: ${vid_names[index]}");
                                            Navigator.pushNamed(context, "/video_play", arguments: VideoScreenArguments(vid_names[index], urls[index]));
                                        },
                                        focusColor: Colors.deepPurpleAccent,
                                      );
                      } 
                    ),
              ),
        ),

      ),
        );
  }
}

class VideoScreenArguments {
  final String playname;
  final String playurl;
  VideoScreenArguments(this.playname, this.playurl);
}

/*  */