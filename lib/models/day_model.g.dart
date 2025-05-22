// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DayModelAdapter extends TypeAdapter<DayModel> {
  @override
  final int typeId = 1;

  @override
  DayModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DayModel(
      dayName: fields[0] as String?,
      date: fields[1] as String?,
      month: fields[2] as String?,
      year: fields[3] as String?,
      menu: (fields[4] as List?)?.cast<MealModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, DayModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.dayName)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.month)
      ..writeByte(3)
      ..write(obj.year)
      ..writeByte(4)
      ..write(obj.menu);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
