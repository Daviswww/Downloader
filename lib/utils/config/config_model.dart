// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ConfigModel {
  final String host;
  final bool debug;
  final bool testing;

  ConfigModel({
    required this.host,
    required this.debug,
    required this.testing,
  });

  ConfigModel copyWith({
    String? host,
    bool? debug,
    bool? testing,
  }) {
    return ConfigModel(
      host: host ?? this.host,
      debug: debug ?? this.debug,
      testing: testing ?? this.testing,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'host': host,
      'debug': debug,
      'testing': testing,
    };
  }

  factory ConfigModel.fromMap(Map<String, dynamic> map) {
    return ConfigModel(
      host: map['host'] as String,
      debug: map['debug'] as bool,
      testing: map['testing'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfigModel.fromJson(String source) =>
      ConfigModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ConfigModel(host: $host, debug: $debug, testing: $testing)';

  @override
  bool operator ==(covariant ConfigModel other) {
    if (identical(this, other)) return true;

    return other.host == host &&
        other.debug == debug &&
        other.testing == testing;
  }

  @override
  int get hashCode => host.hashCode ^ debug.hashCode ^ testing.hashCode;
}
