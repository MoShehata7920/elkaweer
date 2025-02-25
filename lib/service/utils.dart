import 'package:flutter/material.dart';

class Utils {
  BuildContext context;
  Utils(this.context);

  Size get screenSize => MediaQuery.of(context).size;

  Color get bottomNavBarColor => const Color.fromARGB(225, 240, 239, 239);
}
