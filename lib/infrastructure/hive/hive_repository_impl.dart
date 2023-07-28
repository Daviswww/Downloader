import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/domain/hive/entities/hive_failure.dart';
import 'package:myapp/domain/hive/type_adapter/image_adapter.dart';
import 'package:myapp/infrastructure/hive/hive_repository.dart';
import 'package:myapp/share/app_hive_box.dart';
import 'package:path_provider/path_provider.dart';

class HiveRepositoryImpl implements HiveRepository {
  final Box box;
  HiveRepositoryImpl()
      : box = AppHiveBox.imageBox,
        super();
  @override
  Future<Either<HiveFailure, Unit>> save(String url) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final String filename = url.split('/').last;
      final ImageModel imageModel = ImageModel(
        filename: url.split('/').last,
        url: url,
        path: "${dir.path}/$filename",
      );
      box.put(imageModel.filename, imageModel).catchError(
        (e) {
          debugPrint("$e");
        },
      );
      return right(unit);
    } catch (e) {
      return left(SaveHiveDataFailure(message: "$e"));
    }
  }

  @override
  Future<Either<HiveFailure, Unit>> delete(String filename) async {
    try {
      box.delete(filename).catchError(
        (e) {
          debugPrint("$e");
        },
      );
      final dir = await getApplicationDocumentsDirectory();
      final file = File("${dir.path}/$filename");
      await file.delete();
      return right(unit);
    } catch (e) {
      return left(DeleteHiveDataFailure(message: "$e"));
    }
  }
}
