import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

Future<void> downloadFile(String downloadURL) async {
  // Request storage permissions
  var status = await Permission.storage.request();
  if (status.isGranted) {
    Directory? downloadsDir = await getExternalStorageDirectory();
    if (downloadsDir != null) {
      String downloadsPath = downloadsDir.path;

      Directory(downloadsPath).createSync(recursive: true);

      String fileName = downloadURL.split('/').last;

      String filePath = '$downloadsPath/$fileName';

      Dio dio = Dio();
      try {
        await dio.download(downloadURL, filePath);
        print('File downloaded to $filePath');
      } catch (e) {
        print('Failed to download file: $e');
      }
    } else {
      print('Downloads directory not found');
    }
  } else {
    print('Storage permission denied');
  }
}
