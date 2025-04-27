import 'package:apple/core/widgets/responsive_builder.dart';
import 'package:apple/features/home/presentation/mobile/product_detail_mobile.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      mobile: ProductDetailMobile(),
      tablet: ProductDetailMobile(),
      desktop: ProductDetailMobile(),
    );
  }
}
