import 'package:flutter/material.dart';
import 'package:flutter_vm/vm/vm_widget.dart';

class VMCounter extends VMWidget {
  @override
  Map<String, dynamic> initData() {
    return {'counter': 0};
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(width: 120.0, child: Text('VM Counter')),
        Expanded(
            child: Text('Times: ${data.counter}')),
        RaisedButton(
            child: Text('Add'),
            onPressed: () {
              data.counter++;
            })
      ],
    );
  }
}
