import 'package:freezed_annotation/freezed_annotation.dart';

import 'template_base_state.dart';
import 'template_notifier_status.dart';

part 'template_state.freezed.dart';

@freezed
class TemplateState with _$TemplateState implements BaseState {
  const TemplateState._();

  const factory TemplateState({
    @Default(NotifierStatus.loading) NotifierStatus status,
  }) = _TemplateState;

  @override
  bool get isLoading => status == NotifierStatus.loading;
  @override
  bool get isLoadingNext => status == NotifierStatus.loadingNext;
  @override
  bool get isSending => status == NotifierStatus.sending;
  @override
  bool get isReady => status == NotifierStatus.ready;
}
