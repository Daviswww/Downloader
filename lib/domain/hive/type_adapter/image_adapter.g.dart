// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImageModelAdapter extends TypeAdapter<ImageModel> {
  @override
  final int typeId = 1;

  @override
  ImageModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageModel(
      filename: fields[0] as String,
      url: fields[1] as String,
      path: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ImageModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.filename)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(3)
      ..write(obj.path);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
