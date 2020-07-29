import 'package:flutter/material.dart';

class StateCounter extends StatefulWidget {
  StateCounter({Key key}) : super(key: key);

  @override
  _StateCounterState createState() => _StateCounterState();
}

class _StateCounterState extends State<StateCounter> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: Text('State Counter')),
        Expanded(child: Text('Times: $_counter')),
        Expanded(
          child: RaisedButton(
            child: Text('Add'),
            onPressed: _incrementCounter,
          ),
        )
      ],
    );
  }
}
