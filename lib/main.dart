import 'package:flutter/material.dart';
import 'package:media_app/route_generator.dart';
import 'package:splashscreen/splashscreen.dart';
//import 'package:media_app/ui/music_play.dart';
void main() {
  runApp(MaterialApp
  (home: MySplashScreen(),
   debugShowCheckedModeBanner: false,
  ));
}

class MySplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 10,
      navigateAfterSeconds: MyApp(),
      title: Text('Multimedia for the Soul',
                        textScaleFactor: 3,
                        textAlign: TextAlign.center,
                        style:TextStyle(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          shadows: [Shadow( blurRadius: 10.0, color: Colors.grey, offset: Offset(1.0, 5.0),),],
                        ),
                        ),
      image: new Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Treble_a.svg/1200px-Treble_a.svg.png', height: 600, width: 600),
      loadingText: Text("Loading",textScaleFactor: 1.5,),
      photoSize: 100.0,
      loaderColor: Colors.deepPurple,
      gradientBackground: LinearGradient(
        colors: [Colors.deepPurple[800],Colors.deepPurple[600],Colors.deepPurple[500],Colors.blue[600],Colors.blue[500]],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        ) ,
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample Music Player',
      theme: ThemeData.dark(),
      //home: MyHomePage(title: 'Sample Music Player'),
      initialRoute: "/",
      /*routes: {
        "/": (context) => MyHomePage(title: 'Sample Music Player'),
        "/music": (context) => MusicPlay(),
      }*/
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        backgroundColor: Colors.transparent,
        elevation:0.5,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
              children: <Widget>[
                Container 
                ( padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 50.0),
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [Colors.blue[700],Colors.blue[800],Colors.deepPurple[600],Colors.deepPurple[500],Colors.black87,],
                      radius: 1.25,
                      //focalRadius: 50.0,
                      )
                  ),
                  child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                            RaisedButton.icon(
                                  onPressed: () => Navigator.pushNamed(context, "/music"),
                                  padding: EdgeInsets.symmetric(vertical:50.0, horizontal: 40.0),
                                  icon: Icon(Icons.music_note, size: 50.0,),
                                  color: Colors.transparent,
                                  label: Text (
                                        "Music",
                                        style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 36,
                                        ),
                                  ),
                                  highlightColor: Colors.deepPurple,
                                  highlightElevation: 10.0,
                                  //hoverElevation: 100.0,
                                  shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                          side: BorderSide(color: Colors.transparent)),
                            ),

                            RaisedButton.icon(
                                  onPressed: () => Navigator.pushNamed(context, "/video"),
                                  padding: EdgeInsets.symmetric(vertical:50.0, horizontal: 40.0),
                                  color: Colors.transparent,
                                  icon: Icon(Icons.video_label, size: 50.0,),
                                  label: Text (
                                        "Video",
                                        style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 36,
                                        ),
                                  ),
                                  highlightColor: Colors.deepPurple,
                                  highlightElevation: 10.0,
                                  //hoverElevation: 100.0,
                                  shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                          side: BorderSide(color: Colors.transparent)),
                            ),
            ],
          )
          )
        ]
      ), 
    );
  }
}
