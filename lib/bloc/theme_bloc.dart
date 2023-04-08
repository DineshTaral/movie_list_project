import 'package:rxdart/rxdart.dart';

class ThemeBloc {
  final _themeStreamController = BehaviorSubject<bool>();

  Stream<bool> get getThemeStatusStream => _themeStreamController.stream;

  changeTheme() {
    if (!_themeStreamController.hasValue) {
      _themeStreamController.sink.add(false);
    } else {
      _themeStreamController.sink.add(!_themeStreamController.value);
    }
  }
}
