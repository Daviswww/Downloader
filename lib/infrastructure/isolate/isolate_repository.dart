import 'dart:isolate';
import 'package:dartz/dartz.dart';
import 'package:myapp/domain/ioslate/entities/isolate_failure.dart';

abstract class IsolateRepository {
  /// Start isolate to download file
  Future<Either<IoslateFailure, Unit>> start(
    ReceivePort receivePort,
    Function(List<dynamic>) function,
    String url,
  );

  /// Pause isolate
  Future<Either<IoslateFailure, Unit>> pause();

  /// Resume isolate
  Future<Either<IoslateFailure, Unit>> resume();

  /// Cancel isolate
  Future<Either<IoslateFailure, Unit>> cancel();
}
