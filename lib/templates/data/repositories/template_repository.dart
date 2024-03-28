import 'package:flutter_riverpod/flutter_riverpod.dart';

final templateRepositoryProvider = Provider<TemplateRepository>((ref) {
  return TemplateRepository._();
});

class TemplateRepository {
  TemplateRepository._();
}
