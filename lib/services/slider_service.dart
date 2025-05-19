import '../models/slider.dart';
import '../models/api_response.dart';
import '../utils/constants.dart';
import 'api_service.dart';
import 'base_service.dart';
import 'package:flutter/foundation.dart';

class SliderService implements BaseService<SliderModel> {
  final ApiService _apiService;

  SliderService({ApiService? apiService})
      : _apiService = apiService ?? ApiService();

  @override
  Future<List<SliderModel>> getAll() async {
    try {
      final response = await _apiService.get(ApiConstants.sliders);
      debugPrint('Slider API Response: $response');
      
      if (response['success'] == true && response['data'] != null) {
        final List<dynamic> sliders = response['data'] as List;
        return sliders.map((json) => SliderModel.fromJson(json as Map<String, dynamic>)).toList();
      }
      
      if (response['message'] != null) {
        throw Exception(response['message']);
      }
      throw Exception('Invalid response format');
    } catch (e) {
      debugPrint('Error in getAll sliders: $e');
      rethrow;
    }
  }

  @override
  Future<SliderModel> getById(String id) async {
    final response = await _apiService.get('${ApiConstants.sliders}/$id');
    if (response['success'] == true && response['data'] != null) {
      return SliderModel.fromJson(response['data'] as Map<String, dynamic>);
    }
    if (response['message'] != null) {
      throw Exception(response['message']);
    }
    throw Exception('Failed to get slider by ID');
  }
} 