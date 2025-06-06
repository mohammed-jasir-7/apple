
import '../models/template_model.dart';
import 'package:apple/core/params/params.dart';

abstract class TemplateRemoteDataSource {
  Future<TemplateModel> getTemplate({required TemplateParams templateParams});
}

class TemplateRemoteDataSourceImpl implements TemplateRemoteDataSource {
//  final Dio dio;

  TemplateRemoteDataSourceImpl();

  @override
  Future<TemplateModel> getTemplate({required TemplateParams templateParams}) async {
     const response =200;
    // await dio.get(
    //   'https://pokeapi.co/api/v2/pokemon/',
    //   queryParameters: {
    //     'api_key': 'if needed',
    //   },
    // );

    if (response == 200) {
      return TemplateModel.fromJson(json: response as Map<String, dynamic>);
    } else {
      throw Exception();
    }
  }
}
