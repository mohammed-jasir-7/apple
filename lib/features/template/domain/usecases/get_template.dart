import 'package:apple/core/errors/failure.dart';
import 'package:apple/core/params/params.dart';
import 'package:apple/features/template/domain/entities/template_entity.dart';
import 'package:apple/features/template/domain/repositories/template_repository.dart';
import 'package:dartz/dartz.dart';

class GetTemplate {
  final TemplateRepository templateRepository;

  GetTemplate({required this.templateRepository});

  Future<Either<Failure, TemplateEntity>> call({
    required TemplateParams templateParams,
  }) async {
    return await templateRepository.getTemplate(templateParams: templateParams);
  }
}
