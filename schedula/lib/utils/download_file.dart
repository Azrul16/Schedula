import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:schedula/utils/all_dialouge.dart';
import 'dart:io';

import 'package:schedula/utils/toast_message.dart';

class DownloadFile extends StatefulWidget {
  const DownloadFile({
    super.key,
    required this.downloadURL,
  });
  final String downloadURL;

  @override
  State<DownloadFile> createState() => _DownloadFileState();
}

class _DownloadFileState extends State<DownloadFile> {
  bool _isDownloading = false;
  String _progress = "";
  String? _filePath;

  Future<void> downloadFile(String downloadURL) async {
    // Request storage permission
    var status = await Permission.storage.request();
    if (status.isGranted) {
      setState(() {
        _isDownloading = true;
      });

      try {
        // Get the Downloads directory
        Directory downloadsDirectory =
            Directory('/storage/emulated/0/Download');
        if (!downloadsDirectory.existsSync()) {
          downloadsDirectory =
              await getExternalStorageDirectory() ?? downloadsDirectory;
        }

        // Extract the file name and extension from the URL
        String fileName = downloadURL.split('/').last.split('?').first;
        String filePath = '${downloadsDirectory.path}/$fileName';

        // Download the file
        Dio dio = Dio();
        await dio.download(
          downloadURL,
          filePath,
          onReceiveProgress: (received, total) {
            if (total != -1) {
              setState(() {
                _progress = "${((received / total) * 100).toStringAsFixed(0)}%";
                showToastMessageNormal('Download Started');
              });
            }
          },
        );

        setState(() {
          _filePath = filePath;
        });

        print('File downloaded to $filePath');
        showSuccessDialoge(context);
        showToastMessageNormal('File downloaded to $filePath');
      } catch (e) {
        print('Failed to download file: $e');
        showToastMessageWarning('Failed to download file: $e');
      } finally {
        setState(() {
          _isDownloading = false;
        });
      }
    } else {
      print('Storage permission denied');
      showToastMessageWarning('Storage permission denied');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
