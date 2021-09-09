// @dart=2.9
import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:binary_search/main.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';

class Game1 extends StatefulWidget {
  const Game1({Key key}) : super(key: key);

  @override
  _Game1State createState() => _Game1State();
}

class _Game1State extends State<Game1> {

  bool gameStarted = false;
  bool tooHigh = false;
  bool tooLow = false;
  bool isTheNumber = false;
  int lo = 0, hi = 1000;
  int mid = 0;
  int number = 0;
  int counter = 0;
  var arr = List();



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

  chooseNumber(){
    int max = 100;
    int min = 1;
    Random randomNum = new Random();
    number = min + randomNum.nextInt(max);
  }

  startGame(){
    for(int i = 0; i < hi; i++){
      arr.add(i+1);
    }
    playGame();

  }

  playGame(){

    if (lo == hi){
      return lo;
    }

    mid = ((lo+hi)~/2);
    number = arr[mid];

  }

 decide(){
   counter++;
   if(tooHigh)
   {
     hi = mid;
   } else {
     lo = mid + 1;
   }
   playGame();
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

              child: Row(
                children: [
                  if(!isTheNumber && counter<4) Image.asset('assets/jakeAsking.png', scale: 5.25,),
                  if(!isTheNumber && counter>=4) Image.asset('assets/jakeAngry.png', scale: 5.25),
                  if(isTheNumber) Image.asset('assets/jakeWinner.png', scale: 5.25),
                ],
             ),
            ),
            Divider(
              height: 60,
              color: Colors.white,
              thickness: 3,
            ),


            Row(
              children: [
                Text('Jake: ', style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Thunderman',
                  letterSpacing: 2,
                ),
                ),
                SizedBox(
                  width: 10,
                ),

                if(!gameStarted) Text('Think of a number between 1 and $hi', style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Thunderman',
                  letterSpacing: 0.5,
                  ),
                ),
                if(gameStarted && !isTheNumber)  Text('Is your number $number ?', style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'Thunderman',
                letterSpacing: 0.5,
                ),
                ),
                if(isTheNumber)  Text('I win! For the glory of Jakoria!', style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Thunderman',
                  letterSpacing: 0.5,
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
                if (!gameStarted)
                FlatButton(onPressed: (){

                  setState(() {
                    gameStarted = true;
                  });
                  startGame();
                },
                  color: Colors.white,
                  child: Text(

                    'Ok! Got my number',
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
                height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(gameStarted && !isTheNumber)
                FlatButton(onPressed: (){
                  setState(() {
                    tooHigh = true;
                    tooLow = false;
                    isTheNumber = false;

                  });
                  decide();
                },
                  color: Colors.white,
                  child: Text(

                    'A bit high...',
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
              height: 30,
            ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(gameStarted && !isTheNumber)
              FlatButton(onPressed: (){
                setState(() {
                  isTheNumber = true;
                });
                },
                color: Colors.white,
                child: Text(

                'Yes!',
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
              height: 30,
              ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(gameStarted && !isTheNumber)
                FlatButton(onPressed: (){
                  setState(() {
                    tooHigh = false;
                    tooLow = true;
                    isTheNumber = false;

                  });
                  decide();

                },
                  color: Colors.white,
                  child: Text(
                    'A bit low...',
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

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if(counter>=4 && isTheNumber) Text('You made it hard!', style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Thunderman',
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                  ),
                  ),
                  if(counter<4 && isTheNumber) Text('It was too easy', style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Thunderman',
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                  ),
                  ),
                ],
              ),
            ),

            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isTheNumber && (counter>1 || counter==0)) Text('$counter wrong guesses', style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Thunderman',
                    letterSpacing: 2,
                  ),
                  ),
                  if (isTheNumber && counter==1) Text('$counter wrong guess', style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Thunderman',
                    letterSpacing: 2,
                  ),
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Center(
              child: IconButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Home()));
                },
                icon: Icon(
                     Icons.arrow_back

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
