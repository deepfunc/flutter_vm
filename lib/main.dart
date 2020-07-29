import 'package:flutter/material.dart';
import 'package:flutter_vm/state_counter.dart';
import 'package:flutter_vm/vm_counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter VM'),
          ),
          body: Column(
            children: <Widget>[
              StateCounter(),
              VMCounter()
            ],
          ),
        ));
  }
}
