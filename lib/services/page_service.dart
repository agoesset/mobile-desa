import '../models/page.dart';
import '../models/api_response.dart';
import '../utils/constants.dart';
import 'api_service.dart';
import 'base_service.dart';
import 'package:flutter/foundation.dart';

class PageService implements BaseService<Page> {
  final ApiService _apiService;

  PageService({ApiService? apiService})
      : _apiService = apiService ?? ApiService();

  @override
  Future<List<Page>> getAll() async {
    try {
      final response = await _apiService.get(ApiConstants.pages);
      debugPrint('Pages API Response: $response');
      
      if (response['success'] == true) {
        if (response['data'] == null || (response['data'] as List).isEmpty) {
          return [];
        }
        final List<dynamic> pages = response['data'] as List;
        return pages.map((json) => Page.fromJson(json as Map<String, dynamic>)).toList();
      }
      
      if (response['message'] != null) {
        throw Exception(response['message']);
      }
      throw Exception('Invalid response format');
    } catch (e) {
      debugPrint('Error in getAll pages: $e');
      rethrow;
    }
  }

  @override
  Future<Page> getById(String id) async {
    try {
      final response = await _apiService.get('${ApiConstants.pages}/$id');
      debugPrint('Page Detail API Response: $response');

      if (response['success'] == true && response['data'] != null) {
        return Page.fromJson(response['data'] as Map<String, dynamic>);
      }
      
      if (response['message'] != null) {
        throw Exception(response['message']);
      }
      throw Exception('Failed to get page by ID');
    } catch (e) {
      debugPrint('Error in getById: $e');
      rethrow;
    }
  }

  Future<Page> getBySlug(String slug) async {
    try {
      final response = await _apiService.get('${ApiConstants.pages}/$slug');
      debugPrint('Page by Slug API Response: $response');

      if (response['success'] == true && response['data'] != null) {
        return Page.fromJson(response['data'] as Map<String, dynamic>);
      }
      
      if (response['message'] != null) {
        throw Exception(response['message']);
      }
      throw Exception('Failed to get page by slug');
    } catch (e) {
      debugPrint('Error in getBySlug: $e');
      rethrow;
    }
  }
} 