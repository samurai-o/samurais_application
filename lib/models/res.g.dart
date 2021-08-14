// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Res _$ResFromJson(Map<String, dynamic> json) {
  return Res(
    json['code'] as int,
    json['message'] as String,
    json['data'],
  );
}

Map<String, dynamic> _$ResToJson(Res instance) => <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
    };
