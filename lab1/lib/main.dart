import 'package:flutter/material.dart';

void main() {
  runApp( MyFirstFlutterApp());
}

class MyFirstFlutterApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        body: Container(  
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 200, 80, 90),
                Color.fromARGB(255, 92, 118, 164),
                Color.fromARGB(255, 80, 189, 148)
              ]
            )
          ),
          child:const Center(
          child: Text('Adesile Temowo', 
          style:  TextStyle(fontSize: 34)),
        )),
      )

    ));
  }
}
