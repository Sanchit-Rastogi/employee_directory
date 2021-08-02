// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'praise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Praise _$PraiseFromJson(Map<String, dynamic> json) {
  return Praise(
    id: json['id'] as int?,
    sender: json['sender'] as String,
    receiver: json['receiver'] as String,
    title: json['title'] as String,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$PraiseToJson(Praise instance) => <String, dynamic>{
      'id': instance.id,
      'sender': instance.sender,
      'receiver': instance.receiver,
      'title': instance.title,
      'message': instance.message,
    };
