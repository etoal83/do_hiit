import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Do HIIT',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Do HIIT!!'),
          ),
        body: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _time = '';

  @override
  void initState() {
    Timer.periodic(
      Duration(seconds: 1),
      _onTimer,
    );
    super.initState();
  }

  void _onTimer(Timer time) {
    var now = DateTime.now();
    var formatter = DateFormat('HH:mm:ss');
    var formattedTime = formatter.format(now);
    setState(() => _time = formattedTime);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '$_time',
            style: Theme.of(context).textTheme.headline2,
          ),
        ],
      ),
    );
    // floatingActionButton: FloatingActionButton(
    //   onPressed: _incrementCounter,
    //   tooltip: 'Increment',
    //   child: const Icon(Icons.add),
    // ),
  }
}
