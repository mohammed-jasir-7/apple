import 'dart:io';
import 'dart:typed_data';
import 'package:apple/core/errors/failure.dart';
import 'package:apple/core/plugins/path_provider.dart';
import 'package:apple/injectable.dart';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../api/api_client.dart';

/// **Abstract Class for PDF Storage**
/// Defines the contract for handling PDF files, including generation, retrieval, and deletion.
abstract class PDFGenerator {
  /// **Generates a new PDF file**
  ///
  /// This method creates a PDF document containing the given title and content.
  ///
  /// - [title]: The title of the PDF document.
  /// - [content]: The body content of the PDF document.
  /// - Returns an `Either<Failure, File>` where:
  ///   - `Right(File)`: Successfully generated PDF file.
  ///   - `Left(Failure)`: Error during PDF generation.
  Future<Either<Failure, File>> generatePdf({
    required String productName,
    required String imageUrl,
    required String description,
    required Map<String, String> specifications,
  });

  /// **Saves the generated PDF file**
  ///
  /// Persists the PDF file in local storage.
  ///
  /// - [pdf]: The PDF document to be saved.
  /// - [fileName]: The name of the PDF file.
  /// - Returns an `Either<Failure, File>` where:
  ///   - `Right(File)`: Successfully saved PDF file.
  ///   - `Left(Failure)`: Error during file saving.
  Future<Either<Failure, File>> savePdf({
    required pw.Document pdf,
    required String fileName,
  });

  /// **Retrieves a stored PDF file**
  ///
  /// Fetches the PDF file from local storage if it exists.
  ///
  /// - [fileName]: The name of the stored PDF file.
  /// - Returns an `Either<Failure, File>` where:
  ///   - `Right(File)`: Successfully retrieved PDF file.
  ///   - `Left(Failure)`: PDF file not found or retrieval error.
  Future<Either<Failure, File>> getPdf({required String fileName});

  /// **Deletes a PDF file**
  ///
  /// Removes a specific PDF file from local storage.
  ///
  /// - [fileName]: The name of the PDF file to be deleted.
  Future<void> deletePdf({required String fileName});

  /// **Clears all stored PDFs**
  ///
  /// Deletes all PDFs from storage.
  Future<void> clearPdfStorage();
}

/// **Concrete Implementation using `pdf` & `path_provider`**
/// Provides actual handling of PDF generation, storage, and retrieval.
@Injectable(as: PDFGenerator)
class PdfStorageImpl implements PDFGenerator {
  /// **Injects PathStorage Dependency**
  /// Allows better file management with `path_provider`.
  final PathStorage pathStorage;

  PdfStorageImpl({required this.pathStorage});

  @override
  /// **Generates a PDF with Product Details**
  Future<Either<Failure, File>> generatePdf({
    required String productName,
    required String imageUrl,
    required String description,
    required Map<String, String> specifications,
  }) async {
    try {
      final pdf = pw.Document();
      final Uint8List? imageData = await getIt<ApiClient>().fetchImage(
        imageUrl,
      );

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                /// **Product Name**
                pw.Text(
                  productName,
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),

                pw.SizedBox(height: 10),

                /// **Product Image**
                if (imageData != null)
                  pw.Image(pw.MemoryImage(imageData), width: 200, height: 200),

                pw.SizedBox(height: 20),

                /// **Specifications**
                pw.Text(
                  "Specifications:",
                  style: pw.TextStyle(
                    fontSize: 18,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(height: 10),

                /// **Table for Specs**
                // ignore: deprecated_member_use
                pw.Table.fromTextArray(
                  headers: ["Feature", "Details"],
                  data:
                      specifications.entries
                          .map((e) => [e.key, e.value])
                          .toList(),
                  border: pw.TableBorder.all(color: PdfColors.grey),
                  headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  cellStyle: const pw.TextStyle(fontSize: 14),
                ),

                pw.SizedBox(height: 20),

                /// **Description**
                pw.Text(
                  "Description:",
                  style: pw.TextStyle(
                    fontSize: 18,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(height: 5),
                pw.Text(description, style: const pw.TextStyle(fontSize: 16)),
              ],
            );
          },
        ),
      );

      return savePdf(pdf: pdf, fileName: "$productName.pdf");
    } catch (e) {
      return Left(LocalStorageFailure(errorMessage: "PDF generation failed"));
    }
  }

  @override
  Future<Either<Failure, File>> savePdf({
    required pw.Document pdf,
    required String fileName,
  }) async {
    try {
      final output = await pathStorage.getDownloadsDirectory();
      return output.fold((failure) => Left(failure), (directory) async {
        if (directory == null) return Left(LocalStorageFailure(errorMessage: "Directory not found"));
        final file = File("${directory.path}/$fileName");
        await file.writeAsBytes(await pdf.save());
        return Right(file);
      });
    } catch (e) {
      return Left(LocalStorageFailure(errorMessage: "PDF saving failed"));
    }
  }

  @override
  Future<Either<Failure, File>> getPdf({required String fileName}) async {
    try {
      final output = await pathStorage.getDownloadsDirectory();
      return output.fold((failure) => Left(failure), (directory) async {
        if (directory == null) return Left(LocalStorageFailure(errorMessage: "Directory not found"));
        final file = File("${directory.path}/$fileName");
        return (await file.exists())
            ? Right(file)
            : Left(LocalStorageFailure(errorMessage: "PDF not found"));
      });
    } catch (e) {
      return Left(LocalStorageFailure(errorMessage: "PDF retrieval failed"));
    }
  }

  @override
  Future<void> deletePdf({required String fileName}) async {
    final output = await pathStorage.getDownloadsDirectory();
    output.fold((failure) => throw Exception(failure.errorMessage), (
      directory,
    ) async {
      if (directory == null) return;
      final file = File("${directory.path}/$fileName");
      if (await file.exists()) await file.delete();
    });
  }

  @override
  Future<void> clearPdfStorage() async {
    final output = await pathStorage.getDownloadsDirectory();
    output.fold((failure) => throw Exception(failure.errorMessage), (
      directory,
    ) async {
      if (directory == null) return;
      final dir = Directory(directory.path);
      if (await dir.exists()) await dir.delete(recursive: true);
    });
  }
}
