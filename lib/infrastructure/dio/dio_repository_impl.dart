import 'dart:io';
import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:myapp/infrastructure/dio/dio_repository.dart';
import 'package:myapp/share/app_value.dart';

class DioRepositoryImpl implements DioRepository {
  final Dio dio;
  DioRepositoryImpl() : dio = Dio();

  @override
  Future<void> downloadFile(List<dynamic> args) async {
    try {
      final SendPort sp = args[0];
      final String dir = args[1];
      final String url = args[2] == '' ? AppValue.url : args[2];
      await dio.download(
        url,
        "$dir/${url.split('/').last}",
        onReceiveProgress: (count, total) {
          sleep(const Duration(milliseconds: 100));
          sp.send((count / total) * 100);
        },
      );
      debugPrint("Done!");
    } catch (e) {
      debugPrint("$e");
    }
  }
}
