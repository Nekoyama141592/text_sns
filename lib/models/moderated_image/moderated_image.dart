import 'package:freezed_annotation/freezed_annotation.dart';

part 'moderated_image.freezed.dart';
part 'moderated_image.g.dart';

@freezed
abstract class ModeratedImage implements _$ModeratedImage {
  const ModeratedImage._();
  const factory ModeratedImage({
    required String bucketName,
    @Default([]) List<Map<String, dynamic>> moderationLabels, // 不適切な複数の理由
    @Default("") moderationModelVersion, // 検証を行ったモデルの名前
    @Default("") fileName,
  }) = _ModeratedImage;

  factory ModeratedImage.fromJson(Map<String, dynamic> json) =>
      _$ModeratedImageFromJson(json);
}
