import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hrms_app/app/core/utils/app_utils.dart';

part 'chat_message.freezed.dart';
part 'chat_message.g.dart';

@freezed
class ChatMessage with _$ChatMessage {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ChatMessage({
    @JsonKey(fromJson: AppUtils.anyToString) String? id,
    @JsonKey(fromJson: AppUtils.anyToString) String? senderId,
    @JsonKey(fromJson: AppUtils.anyToString) String? receiverId,
    String? text,
    String? file,
    required DateTime createdAt,
    @Default(false) bool read,
    @Default(false) bool? sended,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
}
