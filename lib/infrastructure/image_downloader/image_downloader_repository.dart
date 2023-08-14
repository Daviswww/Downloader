import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:myapp/domain/downloader/entites/downloader_failure.dart';

abstract class ImageDownloaderRepository {
  /// start download file
  Future<Either<DownloaderFailure, Stream<StreamedResponse>>> start(
    String url,
  );

  /// close httpClient and stream
  Future<Either<DownloaderFailure, Unit>> pause(
    StreamSubscription<List<int>> streamSubscription,
  );

  /// resume download file
  Future<Either<DownloaderFailure, Unit>> resume();

  /// close httpClient, stream and init value
  Future<Either<DownloaderFailure, Unit>> cancel();
}
