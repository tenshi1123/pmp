import 'package:flutter/material.dart';

Color main1Color = const Color(0xff00AEEF);
Color main2Color = const Color(0xffA0E5FF);

Color sub1Color = const Color(0xffED1C24);
Color sub2Color = const Color(0xffF47176);

Color key1Color = const Color(0xff163065);
Color key2Color = const Color(0xff254FA7);

Color state1 = const Color(0xffE0E0E0);
Color state2 = const Color(0xffF4F1F3);

Color baseColor = const Color(0xffF3F6F9);
Color keyBlack = const Color(0xff1A2A4D);

LinearGradient mainGradient = const LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment(1, 0.8),
  colors: [
    Color(0xff4EB2FF),
    Color(0xff66D5FF),
  ],
);
LinearGradient asdjajsdhasjidas = const LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment(1, 0.8),
  colors: [
    Color.fromARGB(255, 150, 208, 252),
    Color.fromARGB(255, 234, 248, 253),
  ],
);
LinearGradient mainGradient2 = const LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment(0.8, 1),
  colors: [
    Color(0xff66D5FF),
    Color(0xff4EB2FF),
  ],
);

LinearGradient mainGradient3 = const LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment(0.8, 1),
  colors: [
    Color(0xffF8777C),
    Color(0xffED1C24),
  ],
);
LinearGradient mainGradient4 = LinearGradient(
  begin: Alignment.topLeft,
  end: const Alignment(0.8, 1),
  colors: [
    key1Color.withOpacity(0.3),
    key1Color.withOpacity(0.3),
  ],
);
