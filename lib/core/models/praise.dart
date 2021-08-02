import 'package:json_annotation/json_annotation.dart';

part 'praise.g.dart';

@JsonSerializable()
class Praise {
  int? id = 0;
  String sender;
  String receiver;
  String title;
  String message;

  Praise({
    this.id,
    required this.sender,
    required this.receiver,
    required this.title,
    required this.message,
  });

  factory Praise.fromJson(Map<String, dynamic> json) =>
      _$PraiseFromJson(json);

  Map<String, dynamic> toJson() => _$PraiseToJson(this);
}
