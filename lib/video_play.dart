import 'package:flutter/material.dart';
import 'package:media_app/chewie_list_item.dart';
import 'package:video_player/video_player.dart';
import 'package:marquee/marquee.dart';

class VideoPlay extends StatefulWidget {
  final String playname;
  final String playurl;

  VideoPlay({Key key, @required this.playname, @required this.playurl,}) : super(key: key);

  @override
  _VideoPlayState createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay>
{
  @override
  void initState(){
    super.initState();
    // you can use this.widget.foo here
  }

  @override void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
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
            text: "Now Playing: ${widget.playname}",
            scrollAxis: Axis.horizontal,
            blankSpace: 50.0,
            velocity: 50.0,
            showFadingOnlyWhenScrolling: true,
            ),
        ),

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
                  child: ChewieListItem(
                          videoPlayerController: widget.playurl.contains("https://") ? VideoPlayerController.network(widget.playurl) : VideoPlayerController.asset(widget.playurl),
                          looping: true,
                        )
            ),
          ),
    );
  }
}