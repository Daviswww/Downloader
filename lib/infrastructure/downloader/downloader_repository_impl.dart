import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:myapp/domain/downloader/entites/downloader_failure.dart';
import 'package:myapp/domain/file/model/write_bytes_input_model.dart';
import 'package:myapp/infrastructure/downloader/downloader_repository.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/infrastructure/file/file_repository.dart';
import 'package:myapp/infrastructure/hive/hive_repository.dart';

class DownloaderRepositoryImpl extends DownloaderRepository {
  final FileRepository _fileRepository;
  final HiveRepository _hiveRepository;
  final StreamController<double> _streamController;
  late http.Client httpClient;
  late StreamSubscription<List<int>> streamedResponse;
  int _contentLength = 0;
  int _downloaded = 0;
  String _filename = '';
  String _url = '';
  bool isPause = false;

  DownloaderRepositoryImpl({
    required FileRepository fileRepository,
    required HiveRepository hiveRepository,
    required StreamController<double> streamController,
  })  : _fileRepository = fileRepository,
        _hiveRepository = hiveRepository,
        _streamController = streamController,
        httpClient = http.Client(),
        super();

  @override
  Future<Either<DownloaderFailure, Unit>> start(String url) async {
    try {
      _url = url;
      _filename = url.split('/').last;
      _fileRepository.delete(_filename);
      _contentLength = 0;
      _downloaded = 0;
      httpClient = http.Client();

      final request = http.Request(
        'GET',
        Uri.parse(url),
      )..headers.addAll({
          'Content-type': 'application/json',
          'Accept': 'application/json',
        });
      httpClient.send(request).asStream().listen((http.StreamedResponse r) {
        _contentLength = r.contentLength!;
        streamedResponse = r.stream.listen((value) async {
          final WriteBytesInputModel writeBytesInputModel =
              WriteBytesInputModel(
            filename: _filename,
            offset: _downloaded,
            contentLength: _contentLength,
            chunks: value,
          );
          await _fileRepository.writeAsBytes(writeBytesInputModel);
          _downloaded += value.length;

          _streamController.add(_downloaded / _contentLength);
          sleep(const Duration(milliseconds: 200));
        }, onDone: () async {
          await _hiveRepository.save(url);
          debugPrint("Done!");
        });
      });
      return right(unit);
    } catch (e) {
      return left(DownloaderStartFailure(message: "$e"));
    }
  }

  @override
  Future<Either<DownloaderFailure, Unit>> resume() async {
    try {
      httpClient = http.Client();
      if (_contentLength == 0) {
        return left(const DownloaderResumeFailure(message: "No data"));
      }
      if (!isPause) {
        return left(const DownloaderResumeFailure(message: "No pause"));
      }
      final request = http.Request(
        'GET',
        Uri.parse(_url),
      )..headers.addAll({
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'range': 'bytes=$_downloaded-$_contentLength',
        });

      httpClient.send(request).asStream().listen((http.StreamedResponse r) {
        streamedResponse = r.stream.listen((value) async {
          final WriteBytesInputModel writeBytesInputModel =
              WriteBytesInputModel(
            filename: _filename,
            offset: _downloaded,
            contentLength: _contentLength,
            chunks: value,
          );
          await _fileRepository.writeAsBytes(writeBytesInputModel);
          _downloaded += value.length;

          _streamController.add(_downloaded / _contentLength);
          sleep(const Duration(milliseconds: 200));
        }, onDone: () async {
          await _hiveRepository.save(_url);
          debugPrint("Done!");
        });
      });
      return right(unit);
    } catch (e) {
      return left(DownloaderResumeFailure(message: "$e"));
    }
  }

  @override
  Future<Either<DownloaderFailure, Unit>> pause() async {
    try {
      isPause = true;
      streamedResponse.cancel();
      httpClient.close();
      return right(unit);
    } catch (e) {
      return left(DownloaderPauseFailure(message: "$e"));
    }
  }

  @override
  Future<Either<DownloaderFailure, Unit>> cancel() async {
    try {
      _contentLength = 0;
      _downloaded = 0;
      streamedResponse.cancel();
      httpClient.close();
      return right(unit);
    } catch (e) {
      return left(DownloaderCancelFailure(message: "$e"));
    }
  }
}
