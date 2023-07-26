import 'package:dartz/dartz.dart';
import 'package:myapp/domain/downloader/entites/downloader_failure.dart';

abstract class DownloaderRepository {
  /// start download file
  Future<Either<DownloaderFailure, Unit>> start(String url);

  /// close httpClient and stream
  Future<Either<DownloaderFailure, Unit>> pause();

  /// resume download file
  Future<Either<DownloaderFailure, Unit>> resume();

  /// close httpClient, stream and init value
  Future<Either<DownloaderFailure, Unit>> cancel();
}
