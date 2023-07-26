// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class WriteBytesInputModel {
  String filename;
  int offset;
  int contentLength;
  List<int> chunks;

  WriteBytesInputModel({
    required this.filename,
    required this.offset,
    required this.contentLength,
    required this.chunks,
  });

  WriteBytesInputModel copyWith({
    String? filename,
    int? offset,
    int? contentLength,
    List<int>? chunks,
  }) {
    return WriteBytesInputModel(
      filename: filename ?? this.filename,
      offset: offset ?? this.offset,
      contentLength: contentLength ?? this.contentLength,
      chunks: chunks ?? this.chunks,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'filename': filename,
      'offset': offset,
      'contentLength': contentLength,
      'chunks': chunks,
    };
  }

  factory WriteBytesInputModel.fromMap(Map<String, dynamic> map) {
    return WriteBytesInputModel(
      filename: map['filename'] as String,
      offset: map['offset'] as int,
      contentLength: map['contentLength'] as int,
      chunks: List<int>.from(
        (map['chunks'] as List<int>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory WriteBytesInputModel.fromJson(String source) =>
      WriteBytesInputModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WriteBytesInputModel(filename: $filename, offset: $offset, contentLength: $contentLength, chunks: $chunks)';
  }

  @override
  bool operator ==(covariant WriteBytesInputModel other) {
    if (identical(this, other)) return true;

    return other.filename == filename &&
        other.offset == offset &&
        other.contentLength == contentLength &&
        listEquals(other.chunks, chunks);
  }

  @override
  int get hashCode {
    return filename.hashCode ^
        offset.hashCode ^
        contentLength.hashCode ^
        chunks.hashCode;
  }
}
