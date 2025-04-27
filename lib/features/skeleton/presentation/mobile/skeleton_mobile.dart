import 'dart:io';

import 'package:apple/features/home/presentation/pages/home_screen.dart';
import 'package:apple/features/pdf/presentation/pages/pdf_directory_screen.dart';
import 'package:apple/features/profile/presentation/pages/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkeletonMobile extends StatefulWidget {
  const SkeletonMobile({super.key});

  @override
  State<SkeletonMobile> createState() => _SkeletonMobileState();
}

class _SkeletonMobileState extends State<SkeletonMobile> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  final PageController _pageController = PageController(initialPage: 0);
  void _onItemTapped(int index) {
    _pageController.jumpToPage(index); // Jump to the selected page
    _selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          _selectedIndex.value = index;
        },
        children: const [HomeScreen(), PdfDirectoryScreen(), ProfileScreen()],
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _selectedIndex,
        builder: (context, value, _) {
          return Container(
            constraints: BoxConstraints(
              minHeight: 50.h,
              maxHeight: Platform.isAndroid ? 80.h : 90.h,
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0x21000000),
                  blurRadius: 100.r,
                  offset: const Offset(-1, 0),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: ValueListenableBuilder(
              valueListenable: _selectedIndex,
              builder: (context, value, _) {
                return BottomNavigationBar(
                  showUnselectedLabels: false,
                  showSelectedLabels: false,
                  currentIndex: _selectedIndex.value,
                  selectedIconTheme: IconThemeData(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  selectedItemColor: Theme.of(context).colorScheme.primary,
                  unselectedItemColor: Theme.of(context).colorScheme.onSurface,
                  onTap: _onItemTapped,
                  type: BottomNavigationBarType.fixed,
                  items: [
                    BottomNavigationBarItem(
                      label: "Home",

                      icon: Icon(
                        Icons.home_outlined,
                        color:
                            _selectedIndex.value == 0
                                ? Theme.of(context).colorScheme.primary
                                : const Color(0xFF5E5F60),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: "Cart",
                      icon: Icon(
                        Icons.shopping_bag_outlined,
                        color:
                            _selectedIndex.value == 1
                                ? Theme.of(context).colorScheme.primary
                                : const Color(0xFF5E5F60),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: "Profile",
                      icon: Icon(
                        Icons.person_outline,
                        color:
                            _selectedIndex.value == 2
                                ? Theme.of(context).colorScheme.primary
                                : const Color(0xFF5E5F60),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _selectedIndex.dispose();
    super.dispose();
  }
}
