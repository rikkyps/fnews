// ignore_for_file: dead_code, prefer_const_constructors

import 'package:flutter/material.dart';
import '../pages/pages.dart';

class RouterApp {
  Route? onGenerateRouter(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginPage());
        break;
      case '/home':
        return MaterialPageRoute(builder: (_) => MainPage());
        break;
      case '/logout':
        return MaterialPageRoute(builder: (_) => LoginPage());
        break;
      default:
        return null;
    }
  }
}
