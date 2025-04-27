import 'package:apple/core/constants/constants.dart';
import 'package:apple/core/plugins/file_opener.dart';
import 'package:apple/core/plugins/pdf_generator.dart';
import 'package:apple/core/widgets/error_snackbar.dart';
import 'package:apple/core/widgets/text_widget.dart';
import 'package:apple/features/home/domain/entities/products_entity.dart';
import 'package:apple/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PDFDownloadButton extends StatefulWidget {
  const PDFDownloadButton({super.key, required this.data});

  final DataEntity? data;

  @override
  State<PDFDownloadButton> createState() => _PDFDownloadButtonState();
}

class _PDFDownloadButtonState extends State<PDFDownloadButton> {
  bool isBusy = false;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.all(8.0.w),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black, // Dark background
            foregroundColor: Colors.white, // White text/icon color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                12.r,
              ), // Smooth rounded corners
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 20,
            ), // Comfortable spacing
          ),
          onPressed: () async {
            if (isBusy) return; // Prevent multiple taps
            isBusy = true;
            // Handle PDF download action
            HapticFeedback.lightImpact();
            var result = await getIt<PDFGenerator>().generatePdf(
              productName: widget.data?.name ?? "",
              imageUrl:
                  "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-card-40-iphone16prohero-202409_FMT_WHH?wid=508&hei=472&fmt=p-jpg&qlt=95&.v=1725567599334",
              specifications: {
                "Camera": widget.data?.specifications?.camera ?? "",
                "Chip": widget.data?.specifications?.chip ?? "",
                "RAM": widget.data?.specifications?.rAM ?? "",
                "Storage": widget.data?.specifications?.storage ?? "",
              },
              description: widget.data?.description ?? "",
            );
            if (result.isLeft()) {
              // Handle failure case
              errorSnackBar(context: context, message: kPdfGenerationFailed);
            } else {
              // Handle success case
              successSnackBar(context: context, message: kPdfGenerated);
              // Open the generated PDF file
              final file = result.getOrElse(
                () => throw Exception("Failed to get file"),
              );
              final fileOpener = getIt<FileOpener>();
              await fileOpener.openPDF(file.path);
            }
            isBusy = false; // Reset busy state
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.picture_as_pdf, color: Colors.white),
              SizedBox(width: 8.w),
              TextWidget(
                text: "Download as PDF",
                size: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
