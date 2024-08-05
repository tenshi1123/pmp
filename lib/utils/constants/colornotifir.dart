import 'package:flutter/cupertino.dart';
import 'color.dart';

class ColorNotifier with ChangeNotifier {
  bool isDark = false;

  set setIsDark(v) {
    isDark = v;
    notifyListeners();
  }

  get getIsDark => isDark;

  get getwihitecolor => wihitecolor;

  get getprimeryColor => primeryColor;

  get getblue => blue;

  get getgreay => greay;

  get getblack => black;
  get gettfborder => fieldbordcolor;
  get getcardcolor => cardcolor;

  get getvisacolor => visacolor;
}
