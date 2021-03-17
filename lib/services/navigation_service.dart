import 'package:flutter/cupertino.dart';
import 'package:shop/utils/app_routes.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
  new GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String route) {
    return navigatorKey.currentState.pushReplacementNamed(route);
  }

  bool goBack() {
    final canPop = navigatorKey.currentState.canPop();
    navigatorKey.currentState.pop();
    return canPop;
  }
}