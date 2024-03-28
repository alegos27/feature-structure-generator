import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/states/template_state.dart';
import '../repositories/template_repository.dart';
import 'template_base_notifier.dart';

final templateProvider = StateNotifierProvider<TemplateProvider, TemplateState>((ref) {
  final templateRepository = ref.read(templateRepositoryProvider);
  return TemplateProvider._(templateRepository: templateRepository);
});

class TemplateProvider extends StateNotifier<TemplateState> with BaseNotifier {
  final TemplateRepository templateRepository;

  TemplateProvider._({required this.templateRepository})
      : super(
          const TemplateState(),
        );

  @override
  void init() {}

  @override
  void reset() {}
}
