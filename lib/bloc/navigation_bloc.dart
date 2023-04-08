

import 'package:rxdart/rxdart.dart';

class NavigationBloc {
  final _navigationTabStreamController=BehaviorSubject<int>();
  Stream<int> get getSelectedNavStream=>_navigationTabStreamController.stream;

  setNavIndex({required int index}){
    _navigationTabStreamController.sink.add(index);
  }
}