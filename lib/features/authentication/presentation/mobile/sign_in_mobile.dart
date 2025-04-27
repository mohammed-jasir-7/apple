import 'package:apple/core/constants/constants.dart';

import 'package:apple/core/widgets/text_widget.dart';
import 'package:apple/features/authentication/presentation/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignInMobile extends StatelessWidget {
  const SignInMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    String logoPath = isDarkTheme ? 'assets/png/light_logo.png' : 'assets/png/dark_logo.png';

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(), // Push content down
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(logoPath, width: 80.w, height: 80.h),
                SizedBox(width: 10.w),
                TextWidget(
                  text: kAppName,
                  size: 40.sp,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            const Spacer(), // Push button to bottom
            Padding(
              padding: EdgeInsets.only(bottom: 30.h), // Add bottom padding
              child: SizedBox(
                width: 300.w,
                
                child: Consumer<AuthProvider>(
                  builder: (context, value, child) {
              if (value.user != null) {
      Future.microtask(() => Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false));
    }
                      return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                     shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                     
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    ),
                    onPressed: () {
                      // Handle sign-in with Google action here
                     HapticFeedback.lightImpact();
                      // Add your sign-in logic here
                      context.read<AuthProvider>().signIn();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       Image.asset('assets/png/googlelogo.png', width: 25.w, height: 25.h),
                        SizedBox(width: 10.w),
                      
                        TextWidget(
                          text: 'Sign in with Google',
                          size: 18.sp,
                          fontWeight: FontWeight.w600,
                          
                        ),
                      ],
                    ),
                     
                    
                  );
                    
                    
                  },
                
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
