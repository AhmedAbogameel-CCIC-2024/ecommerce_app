import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteUtils {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static BuildContext context = navigatorKey.currentContext!;

  static Future<dynamic> push(Widget view) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => view,
      ),
    );
  }

  static Future<dynamic> pushReplacement(Widget view) {
    return Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => view,
      ),
    );
  }

  static Future<dynamic> pushAndRemoveAll(Widget view) {
    return Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => view,
      ),
          (route) => false,
    );
  }

  static void pop() {
    return Navigator.of(context).pop();
  }
}