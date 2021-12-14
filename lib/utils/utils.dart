import 'package:flutter/material.dart';
import 'package:gecko_demo/model/coin_model.dart';

class Utils {
  static Route createRouteWithArguments(
      CoinModel coinModel, Widget destination) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => destination,
      settings: RouteSettings(
          arguments: // sending the data to output page
              coinModel),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1, 0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
