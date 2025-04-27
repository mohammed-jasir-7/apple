
import 'package:apple/core/api/api.dart';
import 'package:apple/core/api/api_client.dart';
import 'package:apple/core/api/api_request_queue.dart';
import 'package:apple/core/constants/constants.dart';
import 'package:apple/injectable.config.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
@InjectableInit()
/// Configures the [GetIt] instance with the dependencies required by the app.
///
/// It takes an [env] parameter that can be either "dev", "prod", or "test".
/// Depending on the value of [env], it registers the following factories:
///
/// - [Endpoints] with a base URL of:
///   - "https://run.mocky.io/v3/770517fc-379e-4702-91ec-f119df0d4a72" for "prod",
///   - "https://demoapi/" for "test",
///   - "https://api.example.com/" for "dev".
///
/// It also registers the plugins
///
/// Finally, it initializes the [GetIt] instance with the given environment name.
 configureDependencies(String env)async {
 final sharedPrefs = await SharedPreferences.getInstance();
getIt.registerFactory<Connectivity>(() => Connectivity());
 getIt.registerLazySingleton<ApiClient>(() => ApiClient(),);
 getIt.registerLazySingleton<ApiQueue>(() => ApiQueueImpl());
 getIt.registerSingleton<SharedPreferences>(sharedPrefs);
 
  if(env=="dev"){
//getIt.registerFactory<Endpoints>(() => Endpoints(baseUrl: "http://192.168.1.2:5000/"));
getIt.registerFactory<Endpoints>(() => Endpoints(baseUrl: kBaseUrlDev));
  }else if(env=="prod"){
getIt.registerFactory<Endpoints>(() => Endpoints(baseUrl: kBaseUrlProd));
  }else if(env=="test"){
getIt.registerFactory<Endpoints>(() => Endpoints(baseUrl: kBaseUrlTest));
  }else{
    throw Exception("Invalid Environment");
  }
  
   
  getIt.init(
    environment:env,
  );
}