import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

errorSnackBar({required BuildContext context, required String message}) {
  if (context.mounted) {
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                
                content: Text(message.toString()),
              ));
  }
 
}
successSnackBar({required BuildContext context, required String message}) {
 if (context.mounted) {
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.green,
                
                content: Text(message.toString()),
              ));
  }
}



void showCustomToast(BuildContext context, String message) {
  OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      bottom: 100.0,
      left: MediaQuery.of(context).size.width * 0.1,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 12.0.w),
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(650),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(
            message,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  );

  Overlay.of(context).insert(overlayEntry);
  Future.delayed(const Duration(seconds: 2), () {
    overlayEntry.remove();
  });
}
