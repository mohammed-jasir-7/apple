// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:apple/core/api/api.dart' as _i197;
import 'package:apple/core/connection/network_info.dart' as _i790;
import 'package:apple/core/plugins/file_opener.dart' as _i738;
import 'package:apple/core/plugins/path_provider.dart' as _i523;
import 'package:apple/core/plugins/pdf_generator.dart' as _i474;
import 'package:apple/core/plugins/share_service.dart' as _i531;
import 'package:apple/core/plugins/shared_pref_storage.dart' as _i535;
import 'package:apple/features/authentication/data/datasources/authentication_remote_data_source.dart'
    as _i184;
import 'package:apple/features/authentication/data/repositories/authentication_repository_impl.dart'
    as _i390;
import 'package:apple/features/authentication/domain/repositories/authentication_repository.dart'
    as _i1038;
import 'package:apple/features/authentication/domain/usecases/google_sign_in.dart'
    as _i735;
import 'package:apple/features/authentication/presentation/provider/auth_provider.dart'
    as _i586;
import 'package:apple/features/home/data/datasources/home_remote_data_source.dart'
    as _i477;
import 'package:apple/features/home/data/repositories/home_repository_impl.dart'
    as _i1024;
import 'package:apple/features/home/domain/repositories/home_repository.dart'
    as _i264;
import 'package:apple/features/home/domain/usecases/get_products.dart'
    as _i1028;
import 'package:apple/features/home/presentation/provider/home_provider.dart'
    as _i153;
import 'package:apple/features/pdf/presentation/provider/pdf_provider.dart'
    as _i79;
import 'package:apple/features/skeleton/presentation/provider/theme_provider.dart'
    as _i787;
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i79.PdfProvider>(() => _i79.PdfProvider());
    gh.factory<_i787.ThemeProvider>(() => _i787.ThemeProvider());
    gh.factory<_i535.SharedPrefStorage>(
      () => _i535.SharedPrefStorageImpl(storage: gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i738.FileOpener>(() => _i738.FileOpenerImpl());
    gh.factory<_i184.SocialLogins>(() => _i184.SocialLoginsImpl());
    gh.factory<_i477.HomeRemoteDataSource>(
      () => _i477.HomeRemoteDataSourceImpl(api: gh<_i197.Endpoints>()),
    );
    gh.factory<_i531.ShareService>(() => _i531.ShareServiceImpl());
    gh.factory<_i523.PathStorage>(() => _i523.PathStorageImpl());
    gh.factory<_i790.NetworkInfo>(
      () => _i790.NetworkInfoImpl(gh<_i895.Connectivity>()),
    );
    gh.factory<_i264.HomeRepository>(
      () => _i1024.HomeRepositoryImpl(
        remoteDataSource: gh<_i477.HomeRemoteDataSource>(),
        networkInfo: gh<_i790.NetworkInfo>(),
      ),
    );
    gh.factory<_i474.PDFGenerator>(
      () => _i474.PdfStorageImpl(pathStorage: gh<_i523.PathStorage>()),
    );
    gh.factory<_i1028.GetProducts>(
      () => _i1028.GetProducts(homeRepository: gh<_i264.HomeRepository>()),
    );
    gh.factory<_i1038.AuthenticationRepository>(
      () => _i390.AuthenticationRepositoryImpl(
        socialLogins: gh<_i184.SocialLogins>(),
        networkInfo: gh<_i790.NetworkInfo>(),
      ),
    );
    gh.factory<_i153.HomeProvider>(
      () => _i153.HomeProvider(gh<_i1028.GetProducts>()),
    );
    gh.factory<_i735.GoogleSignIn>(
      () => _i735.GoogleSignIn(
        authenticationRepository: gh<_i1038.AuthenticationRepository>(),
      ),
    );
    gh.factory<_i586.AuthProvider>(
      () => _i586.AuthProvider(gh<_i735.GoogleSignIn>()),
    );
    return this;
  }
}
