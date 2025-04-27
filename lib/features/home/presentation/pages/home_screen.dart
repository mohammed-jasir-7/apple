import 'package:apple/features/authentication/presentation/provider/auth_provider.dart';
import 'package:apple/features/home/presentation/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/responsive_builder.dart';
import '../mobile/home_mobile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
     context.read<AuthProvider>().getUserData();
     context.read<HomeProvider>().fetchProducts();
    });
    return const ResponsiveWidget(
      mobile:  HomeMobile(),
      tablet:  HomeMobile(),
      desktop:  HomeMobile(),
    );
  }
}