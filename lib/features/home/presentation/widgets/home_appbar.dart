

import 'package:apple/core/widgets/text_widget.dart';
import 'package:apple/features/authentication/presentation/provider/auth_provider.dart';
import 'package:apple/features/home/presentation/provider/home_provider.dart';
import 'package:apple/features/home/presentation/widgets/search_and_filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Topbar extends StatelessWidget {
  const Topbar({
    super.key,
 
  });



  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(

      builder: (context, authViewModel, child) {
        
        return SliverAppBar(
          pinned: true, // Keeps app bar always visible
          floating: false, // Prevents collapsing on quick scroll
          expandedHeight: 120.h, // Adjust height if needed
          title: Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: SizedBox(
              width: 200.w,
              child: TextWidget(text: "Hey, ${authViewModel.user?.displayName??""} 👋",
              overflow: TextOverflow.ellipsis,
                size: 20.sp,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ) ,
          actions: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainer,
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4.r)],
                shape: BoxShape.rectangle,borderRadius: BorderRadius.circular(12.r),),
              margin: const EdgeInsets.only(right: 16),
              child: IconButton(
                icon: const Badge(child: Icon(Icons.notifications_none_outlined)),
                onPressed: () {
                
                },
              ),
            ),
          ],
flexibleSpace: FlexibleSpaceBar(
  background: Padding(
    padding: EdgeInsets.only(top: 100.h, left: 16.w, right: 16.w, bottom: 5.h),
    child: Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2.r)],
      ),
      child: ClipRRect(
       borderRadius : BorderRadius.circular(12.r),
        child: TextField(
          onTap:() {
              
            showSearch(
              context: context,
              delegate:  CustomSearchDelegate( context.read<HomeProvider>().products?.data??[]),
            );
          } ,
          readOnly: true,
          
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: const Icon(Icons.filter_alt_outlined),
              onPressed: () {
                // Clear the search field or perform any action
        
              },
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            enabledBorder: InputBorder.none,
            hintText: "Search for Products",
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: Theme.of(context).colorScheme.surfaceContainer,
            border: InputBorder.none, // Removes border color
          ),
        ),
      ),
    ),
  ),
),



        );
      }
    );
  }
}
