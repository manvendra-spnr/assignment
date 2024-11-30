import 'package:flutter/material.dart';

class MediaQueryUtil {
  static late MediaQueryData mq;

  static void init(BuildContext context) {
    mq = MediaQuery.of(context);
  }
}