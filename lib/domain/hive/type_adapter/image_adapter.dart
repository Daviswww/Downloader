// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

part 'image_adapter.g.dart';

@HiveType(typeId: 1)
class ImageModel extends HiveObject {
  @HiveField(0)
  final String filename;

  @HiveField(1)
  final String url;

  @HiveField(3)
  final String path;

  ImageModel({
    required this.filename,
    required this.url,
    required this.path,
  });

  ImageModel copyWith({
    String? filename,
    String? url,
    String? path,
  }) {
    return ImageModel(
      filename: filename ?? this.filename,
      url: url ?? this.url,
      path: path ?? this.path,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'filename': filename,
      'url': url,
      'path': path,
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      filename: map['filename'] as String,
      url: map['url'] as String,
      path: map['path'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageModel.fromJson(String source) =>
      ImageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ImageModel(filename: $filename, url: $url, path: $path)';

  @override
  bool operator ==(covariant ImageModel other) {
    if (identical(this, other)) return true;

    return other.filename == filename && other.url == url && other.path == path;
  }

  @override
  int get hashCode => filename.hashCode ^ url.hashCode ^ path.hashCode;
}
