import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:myapp/domain/downloader/entites/downloader_failure.dart';
import 'package:myapp/infrastructure/image_downloader/image_downloader_repository.dart';

class ImageDownloaderRepositoryImpl implements ImageDownloaderRepository {
  late http.Client httpClient;
  late StreamSubscription<List<int>> streamedResponse;

  bool isPause = false;

  ImageDownloaderRepositoryImpl()
      : httpClient = http.Client(),
        super();

  @override
  Future<Either<DownloaderFailure, Stream<http.StreamedResponse>>> start(
      String url) async {
    try {
      httpClient = http.Client();

      final request = http.Request(
        'GET',
        Uri.parse(url),
      )..headers.addAll({
          'Content-type': 'application/json',
          'Accept': 'application/json',
        });

      return right(httpClient.send(request).asStream());
    } catch (e) {
      return left(DownloaderStartFailure(message: "$e"));
    }
  }

  @override
  Future<Either<DownloaderFailure, Unit>> resume() async {
    try {
      return right(unit);
    } catch (e) {
      return left(DownloaderResumeFailure(message: "$e"));
    }
  }

  @override
  Future<Either<DownloaderFailure, Unit>> pause(
    StreamSubscription<List<int>> streamSubscription,
  ) async {
    try {
      await streamSubscription.cancel();
      httpClient.close();
      return right(unit);
    } catch (e) {
      return left(DownloaderPauseFailure(message: "$e"));
    }
  }

  @override
  Future<Either<DownloaderFailure, Unit>> cancel() async {
    try {
      return right(unit);
    } catch (e) {
      return left(DownloaderCancelFailure(message: "$e"));
    }
  }
}
