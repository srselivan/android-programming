import 'package:flutter/cupertino.dart';

Route createRoute(StatefulWidget statefulWidget, [String? routeName]) {
  return PageRouteBuilder(
    settings: RouteSettings(name: routeName),
    pageBuilder: (context, animation, secondaryAnimation) => statefulWidget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}