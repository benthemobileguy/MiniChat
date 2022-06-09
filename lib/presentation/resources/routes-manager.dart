import 'package:flutter/material.dart';
import 'package:mini_chat/presentation/resources/strings-manager.dart';
import 'package:mini_chat/presentation/screens/conversations/conversations-screen.dart';
import 'package:mini_chat/presentation/screens/home/home-page.dart';

class Routes {
  static const String homeRoute = "/homeRoute";
  static const String conversationRoute = "/conversationsPage";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.conversationRoute:
        return MaterialPageRoute(builder: (_) => const ConversationsPage());
      default:
        return unDefinedRoute();
    }
  }
  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.noRouteFound),
          ),
          body: const Center(child: Text(AppStrings.noRouteFound)),
        ));
  }

}