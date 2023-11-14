import 'package:flutter/material.dart';
import 'package:investcraftpartner/screens/leadsScreens/leadScreen.dart';
import 'package:investcraftpartner/screens/termsSceens/termScreen.dart';

import 'package:provider/provider.dart';

import '../screens/homeScreens/homeScreen.dart';
import '../screens/leadsScreens/viewLeadScreen.dart';
import '../screens/moreScreens/moreScreen.dart';




class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  @override
  Widget build(BuildContext context) {

    Widget? child ;
    if(tabItem == "Page1")
      child = HomeScreen();
    else if(tabItem == "Page2")
      child = ViewLeadScreen();
    else if(tabItem == "Page3")
      child = LeadScreen();
    else if(tabItem == "Page4")
      child = MoreScreen();
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
            builder: (context) => child!
        );
      },
    );
  }
}