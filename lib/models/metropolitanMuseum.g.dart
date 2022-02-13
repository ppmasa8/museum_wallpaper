// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metropolitanMuseum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MetropolitanMuseumAdapter extends TypeAdapter<MetropolitanMuseum> {
  @override
  final int typeId = 0;

  @override
  MetropolitanMuseum read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MetropolitanMuseum(
      primaryImage: fields[0] as String?,
      objectWikidataUrl: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MetropolitanMuseum obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.primaryImage)
      ..writeByte(1)
      ..write(obj.objectWikidataUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MetropolitanMuseumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
