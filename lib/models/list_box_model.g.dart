// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_box_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ListBoxModelAdapter extends TypeAdapter<ListBoxModel> {
  @override
  final int typeId = 2;

  @override
  ListBoxModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ListBoxModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as double,
      fields[3] as double,
      fields[4] as String,
      (fields[5] as List).cast<dynamic>(),
      fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ListBoxModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.key)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.hour)
      ..writeByte(3)
      ..write(obj.minute)
      ..writeByte(4)
      ..write(obj.song)
      ..writeByte(5)
      ..write(obj.days)
      ..writeByte(6)
      ..write(obj.checked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListBoxModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
