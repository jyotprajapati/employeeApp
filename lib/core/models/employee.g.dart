// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Employee _$$_EmployeeFromJson(Map<String, dynamic> json) => _$_Employee(
      id: json['id'] as int?,
      name: json['name'] as String,
      position: json['position'] as String,
      dateJoined: DateTime.parse(json['dateJoined'] as String),
      dateLeft: json['dateLeft'] == null
          ? null
          : DateTime.parse(json['dateLeft'] as String),
      isDeleted: json['isDeleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$_EmployeeToJson(_$_Employee instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'position': instance.position,
      'dateJoined': instance.dateJoined.toIso8601String(),
      'dateLeft': instance.dateLeft?.toIso8601String(),
      'isDeleted': instance.isDeleted,
    };
