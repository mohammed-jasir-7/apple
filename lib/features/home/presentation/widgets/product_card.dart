
import 'dart:ui';

import 'package:apple/core/widgets/cache_image.dart';
import 'package:apple/core/widgets/text_widget.dart';
import 'package:apple/features/home/domain/entities/products_entity.dart';
import 'package:apple/features/home/presentation/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
 
final DataEntity data;
  const ProductCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector
    (
      onTap: () {
        // Navigate to product details screen
        context.read<HomeProvider>().productDetails=data;
        Navigator.pushNamed(context, '/productDetails',);
      },
      child: Card(
        
        color: Theme.of(context).colorScheme.surfaceContainer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        elevation: 1,
        child: Padding(
          padding: EdgeInsets.all(8.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100.h,
                width: 150.w,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withAlpha(100)),
                  borderRadius: BorderRadius.circular(10.r),
                  
                ),
                padding: EdgeInsets.all(5.w),
                
                child: Stack(
                  children: [
                    CacheImage(imageUrl:  data.imageCarousel?.firstOrNull??"assets/png/dark_logo.png", filterQuality: FilterQuality.none,boxFit: BoxFit.fitHeight,),
                     Align(
                        alignment: Alignment.topRight,
                       child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                         children: [
                           ClipRRect(
                             borderRadius: BorderRadius.circular(12),
                             child: BackdropFilter(
                               filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                               child: Container(
                                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(12),
                                   color: const Color.fromARGB(40, 0, 0, 0),
                                  
                                 ),
                                 child: Row(
                                   children: [
                                     const Icon(Icons.star, color: Colors.yellow, size: 18),
                                     const SizedBox(width: 5),
                                     TextWidget(
                                      text: 
                                       '5.0',
                                        color: Colors.white,
                                        size: 14.sp,
                                        fontWeight: FontWeight.w500,
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                           ),
                         ],
                       ),
                     ),
                  ],
                ),
              ),
              
             
              SizedBox(height: 5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100.w,
                    child: TextWidget( text: data.name??"",color: Theme.of(context).colorScheme.onSurface, size: 16.sp, fontWeight: FontWeight.w600,overflow: TextOverflow.ellipsis,maxLines: 1,)),
                   if (true)
                TextWidget( text: "New", color: const Color.fromARGB(255, 245, 100, 3), size: 14.sp, fontWeight: FontWeight.w500),
                ],
              ),
              
              Text(data.price??"0", style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
              Divider(
                color: Colors.grey.withAlpha(100),
                thickness: 1,
              ),
              TextWidget(text: data.description??"", fontWeight: FontWeight.w500, size: 12.sp,maxLines: 2,overflow: TextOverflow.ellipsis,color: Theme.of(context).colorScheme.surfaceTint,),
            ],
          ),
        ),
      ),
    );
  }
}
