import 'package:flutter/material.dart';
import 'package:flutter_vm/vm/vm_widget.dart';

class VMCounter extends VMWidget {
  @override
  Map<String, dynamic> initData() {
    return {'counter': 0};
  }

  @override
  Widget build(BuildContext context, dynamic data) {
    return Row(
      children: <Widget>[
        Expanded(child: Text('VM Counter')),
        Expanded(child: Text('Times: ${data.counter}')),
        Expanded(
          child: RaisedButton(
              child: Text('Add'),
              onPressed: () {
                data.counter++;
              }),
        )
      ],
    );
  }
}
