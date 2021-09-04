import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
        // primaryColor: Colors.orange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? randomNumber;
  String animatText = 'YES';

  double _counterProgress = 0;
  bool _progressDone = true;

  void getRandomNumber() {
    _counterProgress = 0;
    _progressDone = false;
    aminationText();
    Random rnd = Random();
    setState(() {
      randomNumber = rnd.nextInt(2);
      print(randomNumber);
    });
  }

  void aminationText() {
    Timer.periodic(Duration(milliseconds: 100), (Timer t) {
      if (_counterProgress.toStringAsFixed(1) == '1.0') {
        t.cancel();
        setState(() {
          _progressDone = true;
        });
        return;
      }
      setState(() {
        if (animatText == 'YES') {
          animatText = 'NO';
        } else {
          animatText = 'YES';
        }
      });
      _counterProgress += 0.1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YES OR NO'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _progressDone
                ? Container()
                : Text(
                    animatText,
                    style: Theme.of(context).textTheme.headline1,
                  ),
            randomNumber != null && _progressDone == true
                ? Text(
                    randomNumber! < 1 ? 'NO' : 'YES',
                    style: Theme.of(context).textTheme.headline1,
                  )
                : Container(),
            _progressDone
                ? TextButton(
                    onPressed: () => getRandomNumber(),
                    child: Text('say a question and press on the button'),
                  )
                : Container(
                    height: 50,
                  ),
          ],
        ),
      ),
    );
  }
}
