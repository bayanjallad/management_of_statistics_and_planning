import 'package:flutter/material.dart';
import '../featurs/authentication/presentation_layer/pages/signup.dart';
import '../featurs/forms/presention_layer/pages/all_forms.dart';
import '../featurs/forms/presention_layer/pages/questions.dart';


class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute( Signup());

      case '/Signup':
        return _materialRoute(Signup());

      case '/AllForms':
        return _materialRoute(AllForms());

      case '/Questions':
        return _materialRoute(Questions());

      default:
        return _materialRoute( Signup());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}