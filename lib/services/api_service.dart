import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../utils/api_exception.dart';
import '../utils/constants.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  final String baseUrl;
  final http.Client client;

  ApiService({
    String? baseUrl,
    http.Client? client,
  })  : baseUrl = baseUrl ?? ApiConstants.baseUrl,
        client = client ?? http.Client();

  Future<Map<String, dynamic>> get(String endpoint) async {
    try {
      final url = '$baseUrl$endpoint';
      debugPrint('Calling API: $url');
      
      final response = await client
          .get(Uri.parse(url))
          .timeout(Duration(seconds: ApiConstants.timeoutDuration));

      debugPrint('Response status code: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');

      return _handleResponse(response);
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw TimeoutException();
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return json.decode(response.body);
      case 401:
        throw UnauthorizedException();
      case 404:
        throw NotFoundException();
      case 500:
        throw ServerException();
      default:
        throw ApiException(
          message: 'Error occurred with status code: ${response.statusCode}',
          statusCode: response.statusCode,
        );
    }
  }
} 