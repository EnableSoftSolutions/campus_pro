import 'package:flutter/material.dart';

final Color accentColor = Color(0xff7292CF);
final Color primaryColor = Color(0xff2855AE);

final customGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      accentColor,
      primaryColor,
    ]);
