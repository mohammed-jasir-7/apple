import 'package:apple/core/widgets/responsive_builder.dart';
import 'package:apple/features/pdf/presentation/mobile/pdf_directory.dart';
import 'package:apple/features/pdf/presentation/provider/pdf_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PdfDirectoryScreen extends StatefulWidget {
  const PdfDirectoryScreen({super.key});

  @override
  State<PdfDirectoryScreen> createState() => _PdfDirectoryScreenState();
}

class _PdfDirectoryScreenState extends State<PdfDirectoryScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
    context.read<PdfProvider>().findPdfFiles();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(mobile: PdfDirectory(), tablet: PdfDirectory(), desktop: PdfDirectory());
  }
}

