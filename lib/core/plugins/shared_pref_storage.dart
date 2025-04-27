import 'dart:convert';
import 'dart:developer';


import 'package:apple/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';

/// Abstract class defining the contract for SharedPreferences-based storage.
abstract class SharedPrefStorage {
  /// Writes a dynamic value to storage.
  /// If the value is a `Map<String, dynamic>`, it is converted to JSON.
  Future<Either<Failure, bool>> write(
      {required String key, required dynamic value});

  /// Writes a boolean value to storage.
  Future<Either<Failure, bool>> writeBool(
      {required String key, required bool value});

  /// Writes a string value to storage.
  Future<Either<Failure, bool>> writeString(
      {required String key, required String value});

  /// Writes an integer value to storage.
  Future<Either<Failure, bool>> writeInt(
      {required String key, required int value});

  /// Writes a double value to storage.
  Future<Either<Failure, bool>> writeDouble(
      {required String key, required double value});

  /// Retrieves a boolean value from storage.
  Future<Either<Failure, bool>> getBool({required String key});

  /// Retrieves a string value from storage.
  Future<Either<Failure, String>> getString({required String key});

  /// Retrieves an integer value from storage.
  Future<Either<Failure, int>> getInt({required String key});

  /// Retrieves a double value from storage.
  Future<Either<Failure, double>> getDouble({required String key});

  /// Deletes a specific value from storage by its key.
  Future<void> delete({required String key});

  /// Clears all data from storage.
  Future<void> clear();
}

/// Concrete implementation of [SharedPrefStorage] using [SharedPreferences].
@Injectable(as: SharedPrefStorage)
class SharedPrefStorageImpl implements SharedPrefStorage {
  /// Instance of [SharedPreferences].
  final SharedPreferences storage;

  /// Constructor for injecting the [SharedPreferences] dependency.
  SharedPrefStorageImpl({required this.storage});

  /// Writes a dynamic value to storage.
  /// - If the value is a [Map], it is JSON encoded before storing.
  /// - If the value is a [String], it is stored as-is.
  /// Returns [Either] with [Failure] on error or [bool] success flag.
  @override
  Future<Either<Failure, bool>> write(
      {required String key, required dynamic value}) async {
    try {
      if (value is Map<String, dynamic>) {
        await storage.setString(key, jsonEncode(value));
      } else if (value is String) {
        await storage.setString(key, value);
      } else {
        return Left(LocalStorageFailure(errorMessage: kunknownError));
      }
      return const Right(true);
    } catch (e) {
      log(e.toString());
      return Left(LocalStorageFailure(errorMessage: kunknownError));
    }
  }

  /// Writes a boolean value to storage.
  /// Returns [Either] with [Failure] on error or [bool] success flag.
  @override
  Future<Either<Failure, bool>> writeBool(
      {required String key, required bool value}) async {
    try {
      await storage.setBool(key, value);
      return const Right(true);
    } catch (e) {
      log(e.toString());
      return Left(LocalStorageFailure(errorMessage: kunknownError));
    }
  }

  /// Writes a double value to storage.
  /// Returns [Either] with [Failure] on error or [bool] success flag.
  @override
  Future<Either<Failure, bool>> writeDouble(
      {required String key, required double value}) async {
    try {
      await storage.setDouble(key, value);
      return const Right(true);
    } catch (e) {
      log(e.toString());
      return Left(LocalStorageFailure(errorMessage: kunknownError));
    }
  }

  /// Writes an integer value to storage.
  /// Returns [Either] with [Failure] on error or [bool] success flag.
  @override
  Future<Either<Failure, bool>> writeInt(
      {required String key, required int value}) async {
    try {
      await storage.setInt(key, value);
      return const Right(true);
    } catch (e) {
      log(e.toString());
      return Left(LocalStorageFailure(errorMessage: kunknownError));
    }
  }

  /// Writes a string value to storage.
  /// Returns [Either] with [Failure] on error or [bool] success flag.
  @override
  Future<Either<Failure, bool>> writeString(
      {required String key, required String value}) async {
    try {
      await storage.setString(key, value);
      return const Right(true);
    } catch (e) {
      log(e.toString());
      return Left(LocalStorageFailure(errorMessage: kunknownError));
    }
  }

  /// Retrieves a boolean value from storage.
  /// Returns [Either] with [Failure] on error or [bool] value.
  @override
  Future<Either<Failure, bool>> getBool({required String key}) async {
    try {
      var result = storage.getBool(key);
      if (result == null) return Left(LocalStorageFailure(errorMessage: kunknownError));
      return Right(result);
    } catch (e) {
      log(e.toString());
      return Left(LocalStorageFailure(errorMessage: kunknownError));
    }
  }

  /// Retrieves a double value from storage.
  /// Returns [Either] with [Failure] on error or [double] value.
  @override
  Future<Either<Failure, double>> getDouble({required String key}) async {
    try {
      var result = storage.getDouble(key);
      if (result == null) return Left(LocalStorageFailure(errorMessage: kunknownError));
      return Right(result);
    } catch (e) {
      log(e.toString());
      return Left(LocalStorageFailure(errorMessage: kunknownError));
    }
  }

  /// Retrieves an integer value from storage.
  /// Returns [Either] with [Failure] on error or [int] value.
  @override
  Future<Either<Failure, int>> getInt({required String key}) async {
    try {
      var result = storage.getInt(key);
      if (result == null) return Left(LocalStorageFailure(errorMessage: kunknownError));
      return Right(result);
    } catch (e) {
      log(e.toString());
      return Left(LocalStorageFailure(errorMessage: kunknownError));
    }
  }

  /// Retrieves a string value from storage.
  /// Returns [Either] with [Failure] on error or [String] value.
  @override
  Future<Either<Failure, String>> getString({required String key}) async {
    try {
      var result = storage.getString(key);
      if (result == null) return Left(LocalStorageFailure(errorMessage: kunknownError));
      return Right(result);
    } catch (e) {
      log(e.toString());
      return Left(LocalStorageFailure(errorMessage: kunknownError));
    }
  }

  /// Deletes a specific key-value pair from storage.
  @override
  Future<void> delete({required String key}) async {
    await storage.remove(key);
  }

  /// Clears all key-value pairs from storage.
  @override
  Future<void> clear() async {
    await storage.clear();
  }
}
