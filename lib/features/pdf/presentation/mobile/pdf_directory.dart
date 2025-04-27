import 'package:apple/core/utils/utils.dart';
import 'package:apple/core/widgets/text_widget.dart';
import 'package:apple/features/pdf/presentation/provider/pdf_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PdfDirectory extends StatefulWidget {
  const PdfDirectory({super.key});

  @override
  State<PdfDirectory> createState() => _PdfDirectoryState();
}

class _PdfDirectoryState extends State<PdfDirectory> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Directory'),
        actions: [
      //clearall button
          TextButton(
           child: const TextWidget( text: 'Clear All', color: Colors.red,),
            onPressed: () {
              context.read<PdfProvider>().clearAll();
            },
          ),
        ],
      ),
      body:  RefreshIndicator(
        onRefresh: () async {
          WidgetsBinding.instance.addPostFrameCallback((_) {
    context.read<PdfProvider>().findPdfFiles();
    });
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<PdfProvider>(
            builder: (context, pdfProvider, child) {
              if (pdfProvider.isloading) {
                return const Center(child: CircularProgressIndicator());
              } else if (pdfProvider.files == null || pdfProvider.files!.isEmpty) {
                return const Center(child: Text('No PDF files found'));
              }
              return ListView.builder(
                
                itemCount: pdfProvider.files!.length,
                itemBuilder: (context, index) {
                  return DocumentCard(document: pdfProvider.files![index]);
                },
              );
            }
          ),
        ),
      ),
    );
  }
}





class DocumentCard extends StatelessWidget {
  final Document document;
  
  const DocumentCard({super.key, required this.document});

  @override
  Widget build(BuildContext context) {
   var color = Utils.getRandomAccentColor();
    return GestureDetector(
      onTap: ()async {
        // Handle document tap
        HapticFeedback.lightImpact();
        // Open the document or perform any action you want
        context.read<PdfProvider>().openPdfFile(document.path);
      },
      child: Card(
        color: color.withAlpha(50),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.insert_drive_file, color: color, size: 40.sp),
              TextWidget(
                text: document.title,
                size: 16.sp, fontWeight: FontWeight.bold),
              TextWidget(text:  DateFormat('dd/MM/yyyy').format(DateTime.tryParse(document.date)?.toLocal() ?? DateTime.now())),
              TextWidget( text: document.size),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.star_border, color: Colors.black45),
                  //share button
                  ShareButton(document: document),
                  
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShareButton extends StatefulWidget {
  const ShareButton({
    super.key,
    required this.document,
  });

  final Document document;

  @override
  State<ShareButton> createState() => _ShareButtonState();
}

class _ShareButtonState extends State<ShareButton> {
  bool isBusy = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: ()async {
        // Handle share action
        if (isBusy) return; // Prevent multiple taps
        isBusy = true;
       await context.read<PdfProvider>().sharePdfFile(widget.document.path);
        isBusy = false; // Reset busy state

      },
      icon: const Icon(Icons.share, color: Colors.black45),
    );
  }
}

