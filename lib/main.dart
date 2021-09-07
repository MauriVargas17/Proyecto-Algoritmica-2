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



      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text("Click"),
        backgroundColor: Colors.red[600],
      ),
    );
  }
}
