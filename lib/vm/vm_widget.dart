import 'package:flutter/material.dart';

//typedef Build = Widget Function(BuildContext context);

abstract class VMWidget extends StatefulWidget {
  Map<String, dynamic> _data;

  VMWidget({Key key}) : super(key: key) {
//    print('VMWidget()');
  }

  Map<String, dynamic> initData();

  Widget build(BuildContext context, dynamic data);

  @override
  _VMState createState() {
//    print('VMWidget createState()');
    _data = initData();
    var state = _VMState(_data);
    return state;
  }
}

class _VMState extends State<VMWidget> {
  Map<String, dynamic> _data;
  dynamic data;

  _VMState(Map<String, dynamic> data): super() {
    this._data = data;
    this.data = VMData(this._data, this);
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(context, data);
  }

  void update() {
//    print('_VMState update()');
    setState(() {});
  }
}

class VMData {
  Map<String, dynamic> _data;
  _VMState _state;

  VMData(Map<String, dynamic> data, _VMState state) {
    this._data = Map();
    data.forEach((k, v) => _data[new Symbol(k).toString()] = v);
    this._state = state;
//    data.forEach((k, v) {
//      print('k: ${new Symbol(k).toString()}');
//    });
//    print('_data: $_data');
  }

  @override
  noSuchMethod(Invocation invocation) {
    if (invocation.isGetter) {
      var ret = _data[invocation.memberName.toString()];
      if (ret != null) {
        return ret;
      } else {
        super.noSuchMethod(invocation);
      }
    }
    if (invocation.isSetter) {
      _data[invocation.memberName.toString().replaceAll('=', '')] =
          invocation.positionalArguments.first;
      if (_state != null) {
        _state.update();
      } else {
        print('_state is null');
      }
    } else {
      super.noSuchMethod(invocation);
    }
  }
}
