import 'dart:io';

import 'package:apple/core/plugins/file_opener.dart';
import 'package:apple/core/plugins/path_provider.dart';
import 'package:apple/core/utils/utils.dart';
import 'package:apple/injectable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/plugins/share_service.dart';

@Injectable()
class PdfProvider extends ChangeNotifier {
  bool _isloading = false;
  bool get isloading => _isloading;
  List<Document>? files;
  void setIsLoading(bool value) {
    _isloading = value;
    notifyListeners();
  }

  void findPdfFiles() async {
    setIsLoading(true);
    var directory =
        await getIt<PathStorage>()
            .getDownloadsDirectory(); // Assuming this method returns the directory path

    directory.fold((l) {}, (dir) {
      if (dir == null) {
        debugPrint("Directory is null.");
        return;
      } else if (!dir.existsSync()) {
        debugPrint("Directory does not exist.");
        return;
      }

      final pdfFiles =
          dir.listSync().where((file) => file.path.endsWith('.pdf')).toList();
      List<Document> files = [];
      for (var file in pdfFiles) {
        final fileStat = File(file.path).statSync();

        files.add(
          Document(
            title: file.path.split('/').last,
            date: fileStat.changed.toString(),
            size: Utils.getFileSizeString(fileStat.size),
            path: file.path,
            type: "PDF",
          ),
        );
        debugPrint("File Name: ${file.path.split('/').last}");
        debugPrint("Date Downloaded: ${fileStat.changed}");
        debugPrint("---------------");
      }
      this.files = files;
      setIsLoading(false);
      notifyListeners();
    });
  }

  void clearAll() async {
    setIsLoading(true);
    var directory =
        await getIt<PathStorage>()
            .getDownloadsDirectory(); // Assuming this method returns the directory path
    directory.fold((l) {}, (dir) {
      if (dir == null) {
        debugPrint("Directory is null.");
        return;
      } else if (!dir.existsSync()) {
        debugPrint("Directory does not exist.");
        return;
      }
      final pdfFiles =
          dir.listSync().where((file) => file.path.endsWith('.pdf')).toList();
      for (var file in pdfFiles) {
        File(file.path).deleteSync();
      }
      files = null;
      setIsLoading(false);
      notifyListeners();
    });
  }

  //open pdf file
  /// Opens the PDF file at the given path in the default PDF viewer.
  ///
  /// Throws a [Failure] if opening the file fails.
  ///
  /// [path] is the full path to the PDF file to open.
  void openPdfFile(String path) async {
    await getIt<FileOpener>().openFile(path);
  }

  //share pdf file
  /// Shares the PDF file at the given path using the default sharing method.
  ///
  /// Throws a [Failure] if sharing the file fails.
  ///
  /// [path] is the full path to the PDF file to share.
   sharePdfFile(String path) async {
    getIt<ShareService>().shareFile(path).then((value) {
      value.fold(
        (l) => debugPrint("Error sharing file: ${l.errorMessage}"),
        (r) => debugPrint("File shared successfully"),
      );
    });
  }
}

class Document {
  final String title;
  final String date;
  final String size;
  final String type;

  final String path;

  Document({
    required this.title,
    required this.date,
    required this.size,
    required this.path,
    required this.type,
  });
}
