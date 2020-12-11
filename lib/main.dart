import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            child: Container(
              width: double.infinity,
              child: Text(
                'CHART',
              ),
            ),
            color: Colors.lightBlue,
            elevation: 5,
          ),
          Card(
            color: Colors.cyanAccent,
            child: Text(
              'List of TX',
            ),
          ),
        ],
      ),
    );
  }
}
