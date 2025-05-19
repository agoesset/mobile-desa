import '../models/product.dart';
import '../models/api_response.dart';
import '../utils/constants.dart';
import 'api_service.dart';
import 'base_service.dart';
import 'package:flutter/foundation.dart';

class ProductService implements BaseService<Product> {
  final ApiService _apiService;

  ProductService({ApiService? apiService})
      : _apiService = apiService ?? ApiService();

  @override
  Future<List<Product>> getAll() async {
    try {
      final response = await _apiService.get(ApiConstants.products);
      debugPrint('API Response: $response');
      
      if (response['success'] == true && response['data'] != null) {
        final data = response['data'];
        if (data is Map<String, dynamic> && data.containsKey('data')) {
          // Handle paginated response
          final List<dynamic> products = data['data'] as List;
          return products.map((json) => Product.fromJson(json as Map<String, dynamic>)).toList();
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
  Future<Product> getById(String id) async {
    final response = await _apiService.get('${ApiConstants.products}/$id');
    if (response['success'] == true && response['data'] != null) {
      return Product.fromJson(response['data'] as Map<String, dynamic>);
    }
    if (response['message'] != null) {
      throw Exception(response['message']);
    }
    throw Exception('Failed to get product by ID');
  }

  Future<List<Product>> getHomePageProducts() async {
    try {
      final response = await _apiService.get(ApiConstants.productsHome);
      debugPrint('API Response (Home): $response');
      
      if (response['success'] == true && response['data'] != null) {
        final List<dynamic> products = response['data'] as List;
        return products.map((json) => Product.fromJson(json as Map<String, dynamic>)).toList();
      }
      
      if (response['message'] != null) {
        throw Exception(response['message']);
      }
      throw Exception('Invalid response format');
    } catch (e) {
      debugPrint('Error in getHomePageProducts: $e');
      rethrow;
    }
  }

  Future<Product> getBySlug(String slug) async {
    final response = await _apiService.get('${ApiConstants.products}/$slug');
    if (response['success'] == true && response['data'] != null) {
      return Product.fromJson(response['data'] as Map<String, dynamic>);
    }
    if (response['message'] != null) {
      throw Exception(response['message']);
    }
    throw Exception('Failed to get product by slug');
  }
} 