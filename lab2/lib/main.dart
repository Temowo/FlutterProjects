import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(DieRollApp());
}

class DieRollApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DieRollState();
  }
}

class _DieRollState extends State<DieRollApp> {
  var randomInt1 = Random().nextInt(6) + 1;
  var randomInt2 = Random().nextInt(6) + 1;
  void rollDie() {
    setState(() {
      randomInt1 = Random().nextInt(6) + 1;
      randomInt2 = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Roll a Die App'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Roll a Die',
              style: TextStyle(fontSize: 24, color: Color.fromARGB(255, 24, 86, 5)),
            ),
            const SizedBox(
              height: 20,
            ),
           Row(mainAxisAlignment: MainAxisAlignment.center,children: [
            Image.asset('assets/dice-$randomInt1.png', width: 150, height: 150),
            Image.asset('assets/dice-$randomInt2.png', width: 150, height: 150)]),
            
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: rollDie, child: const Text('Roll'))
          ],
        )),
      ),
    );
  }  
} 