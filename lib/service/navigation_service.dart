
import 'package:flutter/material.dart';
class NavigationService {
  void back(BuildContext context, {dynamic result}) {
    Navigator.of(context).pop();
    print('NavigationService: back called with result: $result');
  }


  void navigateTo(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  void replaceWith(BuildContext context, String routeName) {
    Navigator.of(context).pushReplacementNamed(routeName);
  }

  void navigateAndRemoveUntil(BuildContext context, String routeName) {
    Navigator.of(context).pushNamedAndRemoveUntil(routeName, (route) => false);
  }
}