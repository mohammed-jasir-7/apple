import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveWidget({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 900) {
          return desktop; // Large screens (desktop)
        } else if (constraints.maxWidth >= 600) {
          return tablet;  // Medium screens (tablets)
        } else {
          return mobile;  // Small screens (mobile)
        }
      },
    );
  }
}
