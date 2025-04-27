import 'package:apple/core/widgets/responsive_builder.dart';
import 'package:apple/features/profile/presentation/mobile/profile_mobile.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(mobile: ProfileMobile(), tablet: ProfileMobile(), desktop: ProfileMobile());
  }
}