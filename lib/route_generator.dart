import 'package:flutter/material.dart';
import 'package:media_app/main.dart';
import 'package:media_app/ui/music_play.dart';
import 'package:media_app/video_list.dart';
import 'package:media_app/music_list.dart';
import 'package:media_app/video_play.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyHomePage(
          title: "Sample Music App",
        ));
        //return MaterialPageRoute(builder: (_) => MySplashScreen());
      case '/music':
        // Validation of correct data type
          return MaterialPageRoute(
            builder: (_) => MyMusicList(title: "Your Playlist",),
          );
      case '/video':
        // Validation of correct data type
          return MaterialPageRoute(
            builder: (_) => MyVideoList(title: "Your Video List", ),
          );
      case '/music_play':
        // Validation of correct data type
          MusicScreenArguments argument = args;
          return MaterialPageRoute(
            builder: (_) => MusicPlay(
                  playname: argument.playname,
                  playurl: argument.playurl,
                  playsinger: argument.playsinger,
                  playsong_img: argument.playsong_img,
                ),
          );
      case '/video_play':
        // Validation of correct data type
          VideoScreenArguments argument = args;
          return MaterialPageRoute(
            builder: (_) => VideoPlay(
                  playname: argument.playname,
                  playurl: argument.playurl,
            ),
          );
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        //return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
