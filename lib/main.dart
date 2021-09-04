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
        primarySwatch: Colors.blue,
        primaryColor: Colors.orange,
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

  void getRandomNumber() {
    Random rnd = Random();
    setState(() {
      randomNumber = rnd.nextInt(10);
    });
    // print(rnd.nextInt(100));
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
            randomNumber != null
                ? Text(
                    randomNumber! < 5 ? 'no' : 'yes',
                    style: Theme.of(context).textTheme.headline1,
                  )
                : Container(),
            TextButton(
              onPressed: () => getRandomNumber(),
              child: Text('say a question and press on the button'),
            ),
          ],
        ),
      ),
    );
  }
}
