import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:myapp/utils/config/config_model.dart';

class ConfigReader {
  static ConfigModel _config = ConfigModel(
    host: "API_HOST",
    debug: false,
    testing: false,
  );

  static Future<void> initializeApp(String? env) async {
    env = env ?? "development";
    final configString = await rootBundle.loadString('assets/config/env.json');
    final jsonMap = json.decode(configString);
    _config = ConfigModel.fromMap(jsonMap[env]);
  }

  static ConfigModel config() {
    return _config;
  }
}
