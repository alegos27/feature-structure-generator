import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_model.freezed.dart';
part 'template_model.g.dart';

@Freezed(toJson: false)
class Template with _$Template {
  const Template._();

  const factory Template({
    required String id,
  }) = _Template;

  factory Template.fromJson(Map<String, dynamic> json) => _$TemplateFromJson(json);
}
