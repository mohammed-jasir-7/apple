

import 'package:apple/core/constants/constants.dart';
import 'package:apple/features/template/domain/entities/template_entity.dart';

class TemplateModel extends TemplateEntity {
  const TemplateModel({
    required String template,
  }) : super(
          template: template,
        );

  factory TemplateModel.fromJson({required Map<String, dynamic> json}) {
    return TemplateModel(
      template: json[kTemplate],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      kTemplate: template,
    };
  }
}
