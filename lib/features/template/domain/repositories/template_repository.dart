import 'package:apple/core/errors/failure.dart';
import 'package:apple/core/params/params.dart';
import 'package:apple/features/template/domain/entities/template_entity.dart';
import 'package:dartz/dartz.dart';

abstract class TemplateRepository {
  Future<Either<Failure, TemplateEntity>> getTemplate({
    required TemplateParams templateParams,
  });
}