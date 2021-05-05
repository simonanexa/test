import 'package:flutter/material.dart';

import 'bloc.dart';

class Middle extends StatefulWidget {

  final discoverBloc;

  Middle({this.discoverBloc});

  @override
  _MiddleState createState() => _MiddleState();
}

class _MiddleState extends State<Middle> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: (){
        // CheckBloc.changedOnTapped.add(true);
      },
      child: Text("discover"),
    );
  }
}
