import 'dart:io';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:myapp/domain/file/entities/file_failure.dart';
import 'package:myapp/domain/file/model/write_bytes_input_model.dart';
import 'package:myapp/infrastructure/file/file_repository.dart';
import 'package:myapp/share/app_hive_box.dart';

class FileRepositoryImpl implements FileRepository {
  final String dir;

  FileRepositoryImpl()
      : dir = AppHiveBox.dir,
        super();

  @override
  Future<Either<FileFailure, Unit>> delete(String filename) async {
    try {
      final file = File("$dir/$filename");
      await file.delete();
      return right(unit);
    } catch (e) {
      return left(const FileError(message: "Delete File Error"));
    }
  }

  @override
  Future<Either<FileFailure, Unit>> writeAsBytes(
    WriteBytesInputModel input,
  ) async {
    try {
      final Uint8List bytes = Uint8List(input.chunks.length)
        ..setRange(0, input.chunks.length, input.chunks);
      File('$dir/${input.filename}')
          .writeAsBytesSync(bytes, mode: FileMode.append);

      return right(unit);
    } catch (e) {
      return left(const FileError(message: "Save File Error"));
    }
  }
}
