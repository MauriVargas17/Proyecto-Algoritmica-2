// @dart=2.9
import 'package:audioplayers/audio_cache.dart';
import 'package:binary_search/game1.dart';
import 'package:binary_search/game2.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MaterialApp(home: Home()));





class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  int points = 0;

  String pic = 'assets/finn_jake.png';

  AudioPlayer audioPlayer = AudioPlayer();
  AudioPlayerState audioPlayerState = AudioPlayerState.PAUSED;
  AudioCache audioCache;

  String path = 'sounds/ATmusic.mp3';

  @override
  void initState(){
    super.initState();
    audioCache  = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onPlayerStateChanged.listen((AudioPlayerState s){
      setState(() {
        audioPlayerState = s;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.release();
    audioPlayer.dispose();
  }

  playMusic() async{
    await audioCache.play(path);
  }

  pauseMusic() async{
    await audioPlayer.pause();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text("Binary Search", style: TextStyle(
          fontFamily: 'Thunderman',
          color: Colors.blueAccent,

          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),

      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/finn_jake.jpg'),
                radius: 60,
              ),
            ),
            Divider(
              height: 60,
              color: Colors.white,
              thickness: 1,
            ),
            Center(
              child: Text('Guess It!', style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Thunderman',
                  fontSize: 70,
                  fontWeight: FontWeight.bold
              ),
              ),
            ),

            Center(
              child: Text('Select your game', style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Thunderman',
                letterSpacing: 2,
              ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/jakePhoto.png', scale: 2, ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Game1()));
                },
                  color: Colors.white,
                  child: Text(
                    'You vs. Jake',
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Thunderman'

                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/finnPhoto.png', scale: 2, ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Game2()));
                },
                  color: Colors.white,
                  child: Text(
                    'You vs. Finn',
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Thunderman'

                    ),
                  ),
                ),
              ],
            ),

            Center(
              child: IconButton(
                onPressed: (){
                  audioPlayerState == AudioPlayerState.PLAYING
                      ? pauseMusic()
                      : playMusic();
                },
                icon: Icon(audioPlayerState == AudioPlayerState.PLAYING
                  ? Icons.music_note
                    : Icons.music_off
                ),
                iconSize: 20,
                color: Colors.white,

              ),
            ),

          ],
        ),
      ),
    );
  }
}



