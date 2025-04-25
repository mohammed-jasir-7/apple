// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:apple/core/connection/network_info.dart' as _i790;
import 'package:apple/core/plugins/shared_pref_storage.dart' as _i535;
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
    gh.factory<_i535.SharedPrefStorage>(
      () => _i535.SharedPrefStorageImpl(storage: gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i790.NetworkInfo>(
      () => _i790.NetworkInfoImpl(gh<_i895.Connectivity>()),
    );
    return this;
  }
}
