import 'package:flutter/material.dart';

//typedef Build = Widget Function(BuildContext context);

abstract class VMWidget extends StatefulWidget {
  Map<String, dynamic> _data;
  dynamic data;

  VMWidget({Key key}) : super(key: key) {
//    print('VMWidget()');
  }

  Map<String, dynamic> initData();

  Widget build(BuildContext context);

  @override
  _VMState createState() {
//    print('VMWidget createState()');
    _data = initData();
    return _VMState(_data);
//    var state = _VMState(_data);
//    return state;
  }
}

class _VMState extends State<VMWidget> {
  Map<String, dynamic> _data;
  dynamic data;

  _VMState(Map<String, dynamic> data) : super() {
    this._data = data;
    this.data = VMData(this._data, this);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data == null) {
      widget.data = data;
    }
    return widget.build(context);
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
    this._data = data;
    this._state = state;
//    data.forEach((k, v) => _data[new Symbol(k).toString()] = v);
//    data.forEach((k, v) {
//      print('k: ${new Symbol(k).toString()}');
//    });
//    print('_data: $_data');
  }

  String getGetterMemberName(Symbol memberName) {
    String ret = memberName.toString();
    ret = ret.substring(8, ret.length - 2);
    return ret;
  }

  String getSetterMemberName(Symbol memberName) {
    String ret = memberName.toString();
    ret = ret.substring(8, ret.length - 3);
    return ret;
  }

  @override
  noSuchMethod(Invocation invocation) {
    if (invocation.isGetter) {
      String memberName = getGetterMemberName(invocation.memberName);
      var ret = _data[memberName];
      if (ret != null) {
        return ret;
      } else {
        super.noSuchMethod(invocation);
      }
    }
    if (invocation.isSetter) {
      String memberName = getSetterMemberName(invocation.memberName);
      _data[memberName] = invocation.positionalArguments.first;
      if (_state != null) {
        _state.update();
      }
//      if (_state == null) {
//        print('_state is null');
//      }
    } else {
      super.noSuchMethod(invocation);
    }
  }
}
