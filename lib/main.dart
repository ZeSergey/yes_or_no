import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _darkMode = true;
  int? randomNumber;
  String animatText = 'YES';

  double _counterProgress = 0;
  bool _progressDone = true;

  ThemeData _light = ThemeData.light().copyWith(
    primaryColor: Colors.orange,
  );
  ThemeData _dark = ThemeData.dark().copyWith(primaryColor: Colors.orange);

  void getRandomNumber() {
    _counterProgress = 0;
    _progressDone = false;
    animationText();
    Random rnd = Random();
    setState(() {
      randomNumber = rnd.nextInt(2);
      print(randomNumber);
    });
  }

  void animationText() {
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
      _counterProgress += 0.03;
    });
  }

  void darkTheme(bool val) {
    setState(() {
      _darkMode = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'YES or NO',
        darkTheme: _dark,
        theme: _light,
        themeMode: _darkMode ? ThemeMode.dark : ThemeMode.light,
        home: Scaffold(
          appBar: AppBar(
            title: Text('YES OR NO'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                // decoration: BoxDecoration(color: Colors.amber),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Dark:'),
                    Switch(value: _darkMode, onChanged: (val) => darkTheme(val))
                  ],
                ),
              ),
              Expanded(
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
                            child:
                                Text('say a question and press on the button'),
                          )
                        : Container(
                            height: 50,
                          ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
