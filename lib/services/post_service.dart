import '../models/post.dart';
import '../models/api_response.dart';
import '../utils/constants.dart';
import 'api_service.dart';
import 'base_service.dart';
import 'package:flutter/foundation.dart';

class PostService implements BaseService<Post> {
  final ApiService _apiService;

  PostService({ApiService? apiService})
      : _apiService = apiService ?? ApiService();

  @override
  Future<List<Post>> getAll() async {
    try {
      final response = await _apiService.get(ApiConstants.posts);
      debugPrint('API Response: $response');
      
      if (response['success'] == true && response['data'] != null) {
        final data = response['data'];
        if (data is Map<String, dynamic> && data.containsKey('data')) {
          // Handle paginated response
          final List<dynamic> posts = data['data'] as List;
          return posts.map((json) => Post.fromJson(json as Map<String, dynamic>)).toList();
        }
      }
      
      if (response['message'] != null) {
        throw Exception(response['message']);
      }
      throw Exception('Invalid response format');
    } catch (e) {
      debugPrint('Error in getAll: $e');
      rethrow;
    }
  }

  @override
  Future<Post> getById(String id) async {
    final response = await _apiService.get('${ApiConstants.posts}/$id');
    if (response['success'] == true && response['data'] != null) {
      return Post.fromJson(response['data'] as Map<String, dynamic>);
    }
    if (response['message'] != null) {
      throw Exception(response['message']);
    }
    throw Exception('Failed to get post by ID');
  }

  Future<List<Post>> getHomePagePosts() async {
    try {
      final response = await _apiService.get(ApiConstants.postsHome);
      debugPrint('API Response (Home): $response');
      
      if (response['success'] == true && response['data'] != null) {
        final List<dynamic> posts = response['data'] as List;
        return posts.map((json) => Post.fromJson(json as Map<String, dynamic>)).toList();
      }
      
      if (response['message'] != null) {
        throw Exception(response['message']);
      }
      throw Exception('Invalid response format');
    } catch (e) {
      debugPrint('Error in getHomePagePosts: $e');
      rethrow;
    }
  }

  Future<Post> getBySlug(String slug) async {
    final response = await _apiService.get('${ApiConstants.posts}/$slug');
    if (response['success'] == true && response['data'] != null) {
      return Post.fromJson(response['data'] as Map<String, dynamic>);
    }
    if (response['message'] != null) {
      throw Exception(response['message']);
    }
    throw Exception('Failed to get post by slug');
  }

  Future<List<Post>> searchPosts(String keyword) async {
    try {
      final response = await _apiService.get('${ApiConstants.posts}?search=$keyword');
      debugPrint('API Response (Search): $response');
      
      if (response['success'] == true && response['data'] != null) {
        final data = response['data'];
        if (data is Map<String, dynamic> && data.containsKey('data')) {
          final List<dynamic> posts = data['data'] as List;
          return posts.map((json) => Post.fromJson(json as Map<String, dynamic>)).toList();
        }
      }
      
      if (response['message'] != null) {
        throw Exception(response['message']);
      }
      throw Exception('Invalid response format');
    } catch (e) {
      debugPrint('Error in searchPosts: $e');
      rethrow;
    }
  }
} 