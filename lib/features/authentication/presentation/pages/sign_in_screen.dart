import 'package:apple/core/widgets/responsive_builder.dart';
import 'package:apple/features/authentication/presentation/mobile/sign_in_mobile.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(mobile:SignInMobile() , tablet: SignInMobile(), desktop: SignInMobile(),);
  }
}