import 'package:dartz/dartz.dart';
import 'package:myapp/domain/hive/entities/hive_failure.dart';

abstract class HiveRepository {
  /// Save images data in hive db.
  Future<Either<HiveFailure, Unit>> save(String url);

  /// Delete image data and file.
  Future<Either<HiveFailure, Unit>> delete(String filename);
}
