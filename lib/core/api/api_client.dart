import 'dart:typed_data';

import 'package:http/http.dart' as http;


class ApiClient {
  final http.Client _client;

  ApiClient._internal(this._client); // Private constructor for singleton

  static final ApiClient _instance = ApiClient._internal(http.Client());

  factory ApiClient() {
    return _instance;
  }

  http.Client get client => _client;

  Future<http.Response> get(Uri url, {Map<String, String>? headers}) {
    return _client.get(url, headers: headers);
  }

  Future<http.Response> post(Uri url, {Map<String, String>? headers, dynamic body}) {
    return _client.post(url, headers: headers, body: body);
  }

  Future<http.Response> put(Uri url, {Map<String, String>? headers, dynamic body}) {
    return _client.put(url, headers: headers, body: body);
  }

  Future<http.Response> delete(Uri url, {Map<String, String>? headers,dynamic body}) {
    return _client.delete(url, headers: headers);
  }
  /// Fetches the image from the provided URL.
  ///
  /// Returns the image bytes if the request is successful, otherwise returns null.
  ///
  /// Throws an exception if the request fails.
  Future<Uint8List?> fetchImage(String imageUrl) async {
    try {
      final response = await _client.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        return response.bodyBytes;
      } else {
        throw Exception('Failed to load image');
      }
    } catch (e) {
      return null;
    }
  }



  void dispose() {
    _client.close();
  }
}
