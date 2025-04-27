import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:shimmer/shimmer.dart';

class CacheImage extends StatelessWidget {
  const CacheImage({super.key,
    required this.imageUrl,
    this.isProfile = false,
    this.placeHolder,
    this.filterQuality=FilterQuality.none,
    this.boxFit=BoxFit.cover,
    this.alignment=Alignment.center,
  });
final String imageUrl;
final bool isProfile;
final Widget? placeHolder;
final FilterQuality? filterQuality;
final BoxFit? boxFit;
final Alignment? alignment;
  @override
  Widget build(BuildContext context) {
    return imageUrl.isEmpty?Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          color: Colors.grey[300],
          width: double.infinity,
          height: double.infinity,
        ),
      ): CachedNetworkImage(
      
      alignment: alignment??Alignment.center,
      filterQuality: filterQuality??FilterQuality.none,
    
      imageUrl: imageUrl,
      placeholder: (context, url) => Center(child: placeHolder??Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          color: Colors.grey[300],
          width: double.infinity,
          height: double.infinity,
        ),
      )),
      errorWidget: (context, url, error) => isProfile?SvgPicture.asset("assets/svg/CARD VERIATION.svg"):const Icon(Icons.image_not_supported_sharp,color: Colors.grey,),
      fit: boxFit??BoxFit.cover,
    );
  }
}