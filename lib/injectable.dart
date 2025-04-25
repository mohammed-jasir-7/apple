
import 'package:apple/core/api/api.dart';
import 'package:apple/core/api/api_client.dart';
import 'package:apple/core/api/api_request_queue.dart';
import 'package:apple/injectable.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
@InjectableInit()
 configureDependencies(String env)async {
 final sharedPrefs = await SharedPreferences.getInstance();

 getIt.registerLazySingleton<ApiClient>(() => ApiClient(),);
 getIt.registerLazySingleton<ApiQueue>(() => ApiQueueImpl());
 getIt.registerSingleton<SharedPreferences>(sharedPrefs);
  if(env=="dev"){
//getIt.registerFactory<Endpoints>(() => Endpoints(baseUrl: "http://192.168.1.2:5000/"));
getIt.registerFactory<Endpoints>(() => Endpoints(baseUrl: "https://"));
  }else if(env=="prod"){
getIt.registerFactory<Endpoints>(() => Endpoints(baseUrl: "https://run.mocky.io/v3/770517fc-379e-4702-91ec-f119df0d4a72"));
  }else if(env=="test"){
getIt.registerFactory<Endpoints>(() => Endpoints(baseUrl: "https://demoapi/"));
  }
  
   
  getIt.init(
    environment:env,
  );
}