// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatMessageImpl _$$ChatMessageImplFromJson(Map<String, dynamic> json) =>
    _$ChatMessageImpl(
      id: AppUtils.anyToString(json['id']),
      senderId: AppUtils.anyToString(json['sender_id']),
      receiverId: AppUtils.anyToString(json['receiver_id']),
      text: json['text'] as String?,
      file: json['file'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      read: json['read'] as bool? ?? false,
      sended: json['sended'] as bool? ?? false,
    );

Map<String, dynamic> _$$ChatMessageImplToJson(_$ChatMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sender_id': instance.senderId,
      'receiver_id': instance.receiverId,
      'text': instance.text,
      'file': instance.file,
      'created_at': instance.createdAt.toIso8601String(),
      'read': instance.read,
      'sended': instance.sended,
    };
