import 'package:flutter/material.dart';

class AppRoute{
  static GlobalKey<NavigatorState> navKey = GlobalKey();

  toRoute(String route,{ Object? args}){
    navKey.currentState?.pushNamed(route,arguments: args);
  }
  toRouteAndReplace(String route,{ Object? args}){
    navKey.currentState?.pushReplacementNamed(route,arguments: args);
  }
  back(){
    navKey.currentState?.pop();
  }
}