// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crudmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotessAdapter extends TypeAdapter<Notess> {
  @override
  final int typeId = 0;

  @override
  Notess read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Notess(
      title: fields[0] as String?,
      discription: fields[1] as String?,
      imagepath: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Notess obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.discription)
      ..writeByte(2)
      ..write(obj.imagepath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotessAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
