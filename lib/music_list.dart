import 'package:flutter/material.dart';

class MyMusicList extends StatefulWidget {
  MyMusicList({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyMusicListState createState() => _MyMusicListState();
}

class _MyMusicListState extends State<MyMusicList> {
  List<String> names =["Senorita", "Lovely", "Waves","Nandemonaiya","Sparkle","Ambient_C_Motion","NASA_On_A_Mission","Sample Track"];
  List<String> singer =["Shawn Mendes, Camila Cabello", "Billie Eilish, Khalid", "Dean Lewis","RADWIMPS","RADWIMPS",
  "Sample from audioplayers","Sample from audioplayers", "Sample from audioplayers"];

  List<String> urls =["music/Senorita.mp3", "music/Lovely.mp3", "music/Waves.mp3","music/Nandemonaiya.mp3","music/Sparkle.mp3",
  "https://luan.xyz/files/audio/ambient_c_motion.mp3","https://luan.xyz/files/audio/nasa_on_a_mission.mp3",
  "http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio1xtra_mf_p"];

  List<String> song_img =["images/Senorita.jpg", "images/Lovely.jpg", "images/Waves.jpg","images/Nandemonaiya.jpg","images/Sparkle.jpg",
  "images/Music_note.jpg", "images/Music_note.jpg", "images/Music_note.jpg"];

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
                      itemCount: names.length,
                      itemBuilder: (BuildContext context,int index){ 
                        return InkWell(
                                        child: ListTile( 
                                          //leading: Icon(Icons.music_note), 
                                          leading: urls[index].contains("http") ? Icon(Icons.music_note, size: 60.0,) : Image.asset("assets/${song_img[index]}", height: 60, width: 60,),
                                          title:Text(
                                            "${names[index]}",
                                            style: TextStyle(
                                              fontSize: 24.0,
                                            )
                                            ), 
                                          subtitle: Text (
                                            "${singer[index]}",
                                            ),
                                        ),
                                        splashColor: Colors.deepPurple,
                                        onTap: () {
                                            print("Button tapped");
                                            print("Name of song: ${names[index]}");
                                            Navigator.pushNamed(context, "/music_play", arguments: MusicScreenArguments(names[index], urls[index], singer[index], song_img[index]));
                                        },
                                        focusColor: Colors.deepPurpleAccent,
                                      );
                      } 
                    ),
              ),
        ),

      ),
        );
       // This trailing comma makes auto-formatting nicer for build methods.
  }
}

class MusicScreenArguments {
  final String playname;
  final String playurl;
  final String playsinger;
  final String playsong_img;
  MusicScreenArguments(this.playname, this.playurl, this.playsinger, this.playsong_img);
}