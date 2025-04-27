import 'package:apple/core/widgets/lottie_widget.dart';
import 'package:apple/core/widgets/text_widget.dart';
import 'package:apple/features/home/presentation/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../widgets/home_appbar.dart';
import '../widgets/product_card.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // Add your refresh logic here
        await context
            .read<HomeProvider>()
            .fetchProducts(); // Simulate a network call
      },
      child: CustomScrollView(
        slivers: [
          /// **Sticky App Bar**
          const Topbar(),

          /// **GridView for Products**
          ///
          Consumer<HomeProvider>(
            builder: (context, homeProvider, child) {
              if (homeProvider.isLoading) {
                return loading();
              } else if (homeProvider.products?.data == null ||
                  homeProvider.products!.data!.isEmpty) {
                return emptyScreen();
              }
              return SliverPadding(
                padding: EdgeInsets.all(8.w),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        MediaQuery.of(context).size.width > 600 ? 3 : 2,
                    crossAxisSpacing: 5.w,
                    mainAxisSpacing: 5.w,
                    childAspectRatio: 0.75,
                  ),
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return ProductCard(
                      data: homeProvider.products!.data![index],
                    );
                  }, childCount: homeProvider.products!.data!.length),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  SliverToBoxAdapter emptyScreen() {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: double.infinity, // Ensures full width for proper centering
        height: 400.h, // Ensures full height for proper centering
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Center(child: TextWidget(text: "No products available"))],
        ),
      ),
    );
  }

  SliverToBoxAdapter loading() {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: double.infinity,
        height: 400.h, // Ensures full width for proper centering
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 100.h,
                width: 100.w,
                child: const LottieWidget(path: 'assets/json/shopping_loading.json'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
