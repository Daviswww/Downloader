import 'package:dartz/dartz.dart';
import 'package:myapp/domain/file/entities/file_failure.dart';
import 'package:myapp/domain/file/model/write_bytes_input_model.dart';

abstract class FileRepository {
  Future<Either<FileFailure, Unit>> delete(
    String filename,
  );

  Future<Either<FileFailure, Unit>> writeAsBytes(
    WriteBytesInputModel writeBytesInputModel,
  );
}
