import 'package:flutter/cupertino.dart';

class PlayStopProvider extends ChangeNotifier {
  bool isPlayedMultiple;

  PlayStopProvider({this.isPlayedMultiple = false});

  void togglePlayMultiple(bool newValue) {
    isPlayedMultiple = newValue;
    notifyListeners();
  }
}
