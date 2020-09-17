import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:marquee/marquee.dart';

class MusicPlay extends StatefulWidget {
  final String playname;
  final String playurl;
  final String playsinger;
  final String playsong_img;

  MusicPlay({Key key, @required this.playname, @required this.playurl, @required this.playsinger, @required this.playsong_img}) : super(key: key);

  @override
  _MusicPlayState createState() => _MusicPlayState();
}

class _MusicPlayState extends State<MusicPlay>
{

  AudioPlayer audioPlayer;
  AudioCache audioCache;
  var playIcon = Icon(Icons.play_circle_outline);
  var pauseIcon = Icon(Icons.pause_circle_outline);
  var stopIcon = Icon(Icons.stop);
  int pause = 0;
  int play=0;

  @override
  void initState(){
    super.initState();
    // you can use this.widget.foo here
    audioPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: audioPlayer);
  }

  @override void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
    audioPlayer.stop();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Container(
          height:50.0,
          child: Marquee(
            text: "Now Playing: ${widget.playname} by ${widget.playsinger}",
            scrollAxis: Axis.horizontal,
            blankSpace: 50.0,
            velocity: 50.0,
            showFadingOnlyWhenScrolling: true,
            ),
        ),
        //Text("Now Playing: ${widget.playname} by ${widget.playsinger}"),
        backgroundColor: Colors.transparent,
        elevation: 5.0,
        ),
        extendBodyBehindAppBar: true,
          body: Center(
            child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.deepPurple[900],Colors.purple[700],Colors.purple[500],Colors.blue[900],Colors.deepPurple[900]],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Image.asset("assets/${widget.playsong_img}",height: 350,width: 350),
                        padding: EdgeInsets.only(top: 150.0, right: 50.0, left: 50.0, bottom: 0.0),
                        ),
                      Container(
                        child: Text(widget.playname),
                        padding: EdgeInsets.all(1.5),
                        ),
                      Container(
                        child: Text(widget.playsinger),
                        padding: EdgeInsets.all(1.5),
                        ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        margin: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RaisedButton(
                              child: stopIcon,

                              onPressed: () async {
                                  if (play==0)
                                    {
                                      if (pause == 1)
                                      {
                                        print("Song is paused. Now song will be stopped");
                                        audioPlayer.stop();
                                        play=0;
                                        pause=0;
                                      }
                                      else
                                      {
                                        print("Song is already stopped");
                                      }
                                      
                                    }
                                  else
                                    {
                                      audioPlayer.stop();
                                      print("Song is stopped");
                                      play=0;
                                    }
                                  //print(playerState);                      
                                },
                            ),

                            RaisedButton(
                              child: playIcon,
                              onPressed: () async {
                                      if (play==0 && pause ==0)
                                        {
                                          if (widget.playurl.contains("https://"))
                                          {
                                              await audioPlayer.play(widget.playurl);
                                          }
                                          else
                                          {
                                            audioPlayer = await AudioCache().loop(widget.playurl);
                                          }
                                         
                                         play=1;
                                         pause=0;
                                         print("Song has started playing");                                         
                                        }
                                      else if (play==0 && pause ==1)
                                      {
                                        await audioPlayer.resume();
                                        print("Song is resumed");
                                        pause=0;
                                        play=1;
                                      }
                                      else 
                                      {
                                        print ("Audio is already playing");
                                      }
                                      //print(playerState);
                              }
                            ),
                            RaisedButton(
                                child: pauseIcon,
                                onPressed: () async {
                                  if (pause==0) {
                                    pause = await audioPlayer.pause();
                                    print("Song is paused");
                                    play=0;
                                    //print(pause);
                                  }
                                  else
                                  {
                                    print("Audio is already paused");
                                  }
                                  //print(playerState);
                                },
                            )
                          ],
                        ),
                      ),  
                    ],
                  ),
            ),
          ),
    );
  }
}