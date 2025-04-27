import 'package:apple/core/widgets/cache_image.dart';
import 'package:apple/core/widgets/text_widget.dart';
import 'package:apple/features/authentication/presentation/provider/auth_provider.dart';
import 'package:apple/features/skeleton/presentation/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfileMobile extends StatelessWidget {
  const ProfileMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  TextWidget( text: "Profile",
      size: 20.sp, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface,
      ),centerTitle: true,
      actions: [
        IconButton(
          icon:  Icon(Icons.power_settings_new_rounded, size: 28.sp, color: Colors.red),
          onPressed: () {
           /// Handle logout action here
           HapticFeedback.lightImpact();
            _logoutConformation(context);
          },
        ),
      ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// **Profile Section**
              Center(
                child: Column(
                  children: [
                    SizedBox(
  width: 120.w,
  height: 120.h,
  child: const ProfileAvatar(),
)
                 ,
                    const SizedBox(height: 10),
                    TextWidget(
                    text:   context.read<AuthProvider>().user?.displayName??"",
                      size: 22.sp, fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.green,
                          size: 12.sp,
                        ), // Active Status
                        const SizedBox(width: 5),
                        const Text(
                          "Active status",
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextWidget(
                          text: "Dark Mode",
                          size: 18.sp,  
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface
                         
                        ),
                        SizedBox(width: 10.w),
                        Consumer<ThemeProvider>(
                          builder: (context, themeProvider, child) {
                            return Switch(
                              value: themeProvider.themeMode == ThemeMode.dark, // Replace with your state management
                              onChanged: (value) {
                              context.read<ThemeProvider>().toggleTheme();
                              },
                              activeColor: Colors.blue,
                            );
                          }
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
          
              /// **Menu Options**
              _buildMenuItem(context, Icons.edit, "Edit Profile"),
              _buildMenuItem(
                context,
                Icons.location_on_outlined,
                "Shopping Address",
              ),
              _buildMenuItem(context, Icons.favorite_border, "Wishlist"),
              _buildMenuItem(context, Icons.history, "Order History"),
              _buildMenuItem(context, Icons.notifications_none, "Notification"),
              _buildMenuItem(context, Icons.credit_card, "Cards"),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _logoutConformation(BuildContext context) {
    return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Logout"),
                content: const Text("Are you sure you want to logout?"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: const Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<AuthProvider>().signOut();
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: const Text("Logout"),
                  ),
                ],
              );
            },
          );
  }
   Widget _buildMenuItem(BuildContext context, IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, size: 28, color: Colors.grey[700]),
      title: Text(title, style: const TextStyle(fontSize: 18)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {
        // Handle navigation
      },
    );
  }
}







class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          /// **Outer Circle**
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue.withAlpha(90), // Light outer shade
            ),
          ),

          /// **Middle Circle**
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue.withAlpha(150), // Slightly darker shade
            ),
          ),

          /// **Profile Picture (Inner Circle)**
          Container(
           clipBehavior: Clip.antiAlias,
           decoration: BoxDecoration(
             shape: BoxShape.circle,
             color: Colors.white, // White background for the avatar
             border: Border.all(
               color: Colors.blue.withAlpha(200), // Border color
               width: 2,
             ),
           ),
            child: CacheImage(imageUrl: context.read<AuthProvider>().user?.photoURL??"",
             boxFit: BoxFit.cover,
            isProfile: true,
            
             ),
          ),
        ],
      ),
    );
  }
}
