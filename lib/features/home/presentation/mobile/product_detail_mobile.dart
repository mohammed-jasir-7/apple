import 'package:apple/core/widgets/carousel_widget.dart';
import 'package:apple/core/widgets/text_widget.dart';
import 'package:apple/features/home/presentation/provider/home_provider.dart';
import 'package:apple/features/home/presentation/widgets/pdf_download_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductDetailMobile extends StatelessWidget {
  const ProductDetailMobile({super.key});

  @override
  Widget build(BuildContext context) {
    var data = context.read<HomeProvider>().productDetails;
    return Scaffold(
      body: Stack(
        children: [
          /// **Image Carousel**
          CarouselWidget(
            imageUrls: const [
              "https://example.com/image1.jpg",
              "https://example.com/image2.jpg",
              "https://example.com/image3.jpg",
            ],
            height: 250.h,
          ),
          buildAppbar(context),

          /// **Blended Overlay Container**
          Positioned(
            top: 100.h, // Adjust overlay position
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: Container(
                height: 130.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter, // Start from bottom
                    end: Alignment.topCenter, // Fades toward middle
                    colors: [
                      Theme.of(
                        context,
                      ).colorScheme.surface, // Stronger color at bottom
                      Theme.of(context)
                          .colorScheme
                          .surface, // Light fade-out effect in the middle
                      Colors.white.withAlpha(0), // Fully blended at the top
                    ],
                  ),
                ),
              ),
            ),
          ),

          /// **Product Details**
          Padding(
            padding: EdgeInsets.only(top: 200.h, left: 12.w, right: 12.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// **Product Name & Rating**
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: data?.name ?? "",
                        size: 22.sp,
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 20.sp),
                      TextWidget(
                        text: "4.9 (210 reviews)",
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  /// **Price Display**
                  TextWidget(
                    text: data?.price ?? "",
                    size: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface
                  ),
                  const SizedBox(height: 15),
                  Divider(color: Colors.grey.withAlpha(100), thickness: 1),
                  //specifications
                  TextWidget(
                    text: "Specifications",
                    size: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface
                  ),
                  const SizedBox(height: 10),
                  TextWidget(
                    text: "Camera: ${data?.specifications?.camera ?? ""}",
                    size: 16.sp,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  TextWidget(
                    text: "Chip: ${data?.specifications?.chip ?? ""}",
                    size: 16.sp,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  TextWidget(
                    text: "RAM: ${data?.specifications?.rAM ?? ""}",
                    size: 16.sp,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  TextWidget(
                    text: "Storage: ${data?.specifications?.storage ?? ""}",
                    size: 16.sp,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),

                  Divider(color: Colors.grey.withAlpha(100), thickness: 1),

                  /// **Description**
                  TextWidget(
                    text: data?.description ?? "",
                    size: 16.sp,
                    color: Theme.of(context).colorScheme.onSecondary,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),

          /// **Download as PDF Button**
          PDFDownloadButton(data: data),
        ],
      ),
    );
  }

  SafeArea buildAppbar(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8), // Adds spacing inside the circle
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSecondary.withAlpha(100),
                  width: 1,
                ), // Circular border
              ),
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8), // Adds spacing inside the circle
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSecondary.withAlpha(100),
                  width: 1,
                ), // Circular border
              ),
              child: Icon(
                Icons.share,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
