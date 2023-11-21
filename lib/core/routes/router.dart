import 'package:codeware_task/core/routes/route_name.dart';
import 'package:flutter/material.dart';

import '../../features/json_task_pages/presentation/ui/homepage.dart';
import '../../features/json_task_pages/presentation/ui/show_output_one_page.dart';
import '../../features/json_task_pages/presentation/ui/show_output_two_page.dart';
import '../../features/splash_screen/splash_screen.dart';

class RouteGenerator {
  static pushNamed(BuildContext context, String pageName) {
    return Navigator.pushNamed(context, pageName);
  }
  static pushNamedAndRemoveAll(BuildContext context, String pageName) {
    return Navigator.of(context)
        .pushNamedAndRemoveUntil(pageName, (Route<dynamic> route) => false);
  }
  Future<dynamic> pushNamedSms(BuildContext context, String pageName,
      {List arguments = const []}) {
    return Navigator.pushNamed(context, pageName, arguments: arguments);
  }

  static pushNamedforAdvanceSearch(
      BuildContext context, String pageName, Function filterActionEvent) {
    return Navigator.of(context).pushNamed(pageName);
  }


  static pushReplacementNamed(BuildContext context, String pageName,
      {List arguments = const []}) {
    return Navigator.pushReplacementNamed(context, pageName,
        arguments: arguments);
  }

  static pop(BuildContext context) {
    return Navigator.of(context).pop();
  }
  static popAndPushNamed(BuildContext context, String pageName,
      {List arguments = const []}) {
    return Navigator.popAndPushNamed(context, pageName, arguments: arguments);
  }

  static popAll(BuildContext context) {
    return Navigator.of(context).popUntil((route) => false);
  }

  static popUntil(BuildContext context, String pageName) {
    return Navigator.of(context).popUntil(ModalRoute.withName(pageName));
  }

  // ================================== Routing =============================================

  static Route<dynamic>? onRouteGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashScreenRouteName:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.homepage:
        return MaterialPageRoute(
          builder: (context) =>  Homepage(),
        );
      case Routes.showOutputOne:
        return MaterialPageRoute(
          builder: (context) =>  const ShowOutputOne(),
        );
      case Routes.showOutputTwo:
        return MaterialPageRoute(
          builder: (context) =>  const ShowOutputTwoPage(),
        );

    }
    return null;
  }
}
