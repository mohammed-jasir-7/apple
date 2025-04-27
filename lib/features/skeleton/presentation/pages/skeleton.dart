import 'package:apple/core/widgets/responsive_builder.dart';
import 'package:apple/features/skeleton/presentation/mobile/skeleton_mobile.dart';
import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return  const ResponsiveWidget(
      mobile: SkeletonMobile(),
      tablet: SkeletonMobile(),
      desktop: SkeletonMobile(),
    );
  }
}