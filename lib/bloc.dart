import 'dart:async';

import 'package:rxdart/rxdart.dart';

class CheckBloc{
  final onTappedController = StreamController<bool>();

  StreamSink<bool> get changedOnTapped=> onTappedController.sink;
  Stream<bool> get  onTapped=>onTappedController.stream;



}