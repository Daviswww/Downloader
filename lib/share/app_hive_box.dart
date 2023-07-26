import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/domain/hive/type_adapter/image_adapter.dart';

class AppHiveBox {
  // Box Name
  static const String envBoxName = "env";
  static const String imageBoxName = "imageBox";

  // Box
  static Box imageBox = Hive.box<ImageModel>('imageBox');
  static Box envBox = Hive.box('env');

  // Value
  static String dir = Hive.box('env').get('dir');
}
