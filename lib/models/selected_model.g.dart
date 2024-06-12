// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SelectedModelAdapter extends TypeAdapter<SelectedModel> {
  @override
  final int typeId = 1;

  @override
  SelectedModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SelectedModel(
      fields[0] as String,
      fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SelectedModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.key)
      ..writeByte(1)
      ..write(obj.checked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SelectedModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
