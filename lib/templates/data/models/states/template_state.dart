import 'package:freezed_annotation/freezed_annotation.dart';

import 'template_base_state.dart';
import '../../providers/template_base_notifier_status.dart';

part 'template_state.freezed.dart';

@freezed
class TemplateState with _$TemplateState implements BaseState {
  const TemplateState._();

  const factory TemplateState({
    @Default(BaseNotifierStatus.loading) BaseNotifierStatus status,
  }) = _TemplateState;

  @override
  bool get isLoading => status == BaseNotifierStatus.loading;
  @override
  bool get isLoadingNext => status == BaseNotifierStatus.loadingNext;
  @override
  bool get isSending => status == BaseNotifierStatus.sending;
  @override
  bool get isReady => status == BaseNotifierStatus.ready;
}
