import 'package:apple/core/widgets/cache_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselWidget extends StatelessWidget {
  final List<String> imageUrls;
  final double height;
  final double viewportFraction;
  final bool autoPlay;

  const CarouselWidget({
    super.key,
    required this.imageUrls,
    this.height = 250,
    this.viewportFraction = 0.9, // Dynamic control over viewport visibility
    this.autoPlay = true,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: imageUrls.length,
      options: CarouselOptions(
        height: height,
        autoPlay: autoPlay,
        enlargeCenterPage: true,
        viewportFraction: viewportFraction, // User-defined viewport fraction
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
      itemBuilder: (context, index, _) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: const CacheImage(imageUrl: "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-card-40-iphone16prohero-202409_FMT_WHH?wid=508&hei=472&fmt=p-jpg&qlt=95&.v=1725567599334", boxFit: BoxFit.cover,),
        );
      },
    );
  }
}
