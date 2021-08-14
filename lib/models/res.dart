import 'package:json_annotation/json_annotation.dart';

part 'res.g.dart';

@JsonSerializable()
class Res {
  Res(this.code, this.message, this.data);
  int code;
  dynamic data;
  String message;

  factory Res.fromJson(Map<String, dynamic> json) => _$ResFromJson(json);
  Map<String, dynamic> toJson() => _$ResToJson(this);
}
