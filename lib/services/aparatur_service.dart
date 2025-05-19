import '../models/aparatur.dart';
import '../models/api_response.dart';
import '../utils/constants.dart';
import 'api_service.dart';
import 'base_service.dart';
import 'package:flutter/foundation.dart';

class AparaturService implements BaseService<Aparatur> {
  final ApiService _apiService;

  AparaturService({ApiService? apiService})
      : _apiService = apiService ?? ApiService();

  @override
  Future<List<Aparatur>> getAll() async {
    try {
      final response = await _apiService.get(ApiConstants.aparaturs);
      debugPrint('Aparatur API Response: $response');
      
      if (response['success'] == true && response['data'] != null) {
        final List<dynamic> aparaturs = response['data'] as List;
        return aparaturs.map((json) => Aparatur.fromJson(json as Map<String, dynamic>)).toList();
      }
      
      if (response['message'] != null) {
        throw Exception(response['message']);
      }
      throw Exception('Invalid response format');
    } catch (e) {
      debugPrint('Error in getAll aparaturs: $e');
      rethrow;
    }
  }

  @override
  Future<Aparatur> getById(String id) async {
    final response = await _apiService.get('${ApiConstants.aparaturs}/$id');
    return Aparatur.fromJson(response['data']);
  }
} 