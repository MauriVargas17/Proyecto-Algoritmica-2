import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Binary Search", style: TextStyle(
          fontFamily: 'GoogleSans'
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),

      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Expanded(
            flex: 2,
              child: Image.asset('assets/finn.png')
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.cyan,
              child: Text('Hello', style: TextStyle(
                  fontFamily: 'GoogleSans'
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.pink,
              child: Text('GoodBye', style: TextStyle(
                fontFamily: 'GoogleSans'
                ),
              ),

            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.lightGreen,
              child: Text('Hello Again!', style: TextStyle(
                fontFamily: 'GoogleSans'
                ),
              ),
            ),
          ),
        ],
      ),

      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: <Widget>[
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //         Text('data'),
      //         Text('Info'),
      //       ],
      //     ),
      //     Container(
      //       padding: EdgeInsets.all(20),
      //       color: Colors.amber,
      //       child: Text('1'),
      //     ),
      //
      //     Container(
      //       padding: EdgeInsets.all(30),
      //       color: Colors.deepPurple,
      //       child: Text('2'),
      //     ),
      //
      //     Container(
      //       padding: EdgeInsets.all(40),
      //       color: Colors.red,
      //       child: Text('3'),
      //     ),
      //   ],
      // ),

      // body: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //
      //   children: <Widget>[
      //     Text('Helloo'),
      //     FlatButton(
      //       onPressed: (){
      //
      //       },
      //       color: Colors.blueGrey,
      //       child: Text('Ahoy'),
      //     ),
      //     Container(
      //       color: Colors.red[600],
      //       padding: EdgeInsets.all(20),
      //       child: Icon(
      //         Icons.account_circle_rounded
      //       ),
      //     ),
      //   ],
      // ),

      // body: Padding(
      //   padding: EdgeInsets.all(100),
      //   child: Text('Hello'),
      // ),

      // body: Container(
      //  padding: EdgeInsets.fromLTRB(20, 50, 20, 70),
      //   margin: EdgeInsets.all(2),
      //   color: Colors.blueGrey,
      //   child: Text('Hey'),
      //
      // ),
      // body: Center(

      // child: Text("Ahoy",
      //   style: TextStyle(
      //       fontSize: 20,
      //       fontWeight: FontWeight.bold,
      //       letterSpacing: 2,
      //       color: Colors.blueGrey,
      //       fontFamily: 'GoogleSans'
      //   ),
      // ),

      //child: Image.asset('assets/finn.png'),

      // child: Icon(
      //   Icons.call_end_rounded,
      //   color: Colors.red[600],
      //   size: 50,

      // child: RaisedButton.icon(
      //   onPressed: (){
      //     print('button pressed');
      //   },
      //   icon: Icon(
      //     Icons.ac_unit
      //   ),
      //   label: Text('Snow'),
      //   color: Colors.red[600],
      //
      // ),

      // child: IconButton(
      //   onPressed: (){
      //     print('snowing...');
      //   },
      //   icon: Icon(
      //     Icons.ac_unit_outlined
      //   ),
      //   iconSize: 100,
      //   color: Colors.red[600],
      // ),

      //),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text("Click"),
        backgroundColor: Colors.red[600],
      ),
    );
  }
}
