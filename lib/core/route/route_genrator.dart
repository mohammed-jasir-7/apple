

import 'package:apple/core/widgets/error_screen.dart';
import 'package:apple/features/authentication/presentation/pages/sign_in_screen.dart';
import 'package:apple/features/skeleton/presentation/pages/skeleton.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/pages/product_details_screen.dart';

class RouteGenerator {
  static String? route;
  RouteGenerator();
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    
    switch (settings.name) {
      case '/productDetails':
        return _rightToLeft(const ProductDetailsScreen(), settings.name);
      case 'signIn':
        return _rightToLeft(const SignInScreen(), settings.name);
      case '/':
        return _rightToLeft(const Skeleton(), settings.name);
      default:
        return _rightToLeft(const ErrorScreen(), settings.name);
    
  }
}}

Route _rightToLeft(Widget widget, String? name) {
  return PageRouteBuilder(
    settings: RouteSettings(name: name),
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      // Optimize Tween creation
    final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    final offsetAnimation = animation.drive(tween);

    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
    },
  );
}
