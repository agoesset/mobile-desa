import 'package:flutter/foundation.dart';
import '../models/product.dart';
import '../services/product_service.dart';
import '../utils/constants.dart';
import '../utils/api_exception.dart';
import 'base_state.dart';

class ProductProvider extends ChangeNotifier {
  final ProductService _productService;
  BaseState<List<Product>> _state = BaseState.initial();
  List<Product> _homeProducts = [];

  ProductProvider({ProductService? productService})
      : _productService = productService ?? ProductService();

  BaseState<List<Product>> get state => _state;
  List<Product> get homeProducts => _homeProducts;

  Future<void> loadProducts() async {
    try {
      _state = _state.copyWith(status: Status.loading);
      notifyListeners();

      final products = await _productService.getAll();
      
      _state = BaseState.success(products);
    } catch (e) {
      _state = BaseState.error(e.toString());
      debugPrint('Error loading products: $e');
    }
    notifyListeners();
  }

  Future<void> loadHomeProducts() async {
    try {
      _state = _state.copyWith(status: Status.loading);
      notifyListeners();

      final products = await _productService.getHomePageProducts();
      _homeProducts = products;
      
      _state = BaseState.success(products);
    } catch (e) {
      final errorMessage = e is ApiException ? e.message : AppConstants.defaultErrorMessage;
      _state = BaseState.error(errorMessage);
      _homeProducts = [];
      debugPrint('Error loading home products: $e');
    }
    notifyListeners();
  }

  Future<void> loadProductBySlug(String slug) async {
    try {
      _state = _state.copyWith(status: Status.loading);
      notifyListeners();

      final product = await _productService.getBySlug(slug);
      
      _state = BaseState.success([product]);
    } catch (e) {
      final errorMessage = e is ApiException ? e.message : AppConstants.defaultErrorMessage;
      _state = BaseState.error(errorMessage);
      debugPrint('Error loading product by slug: $e');
    }
    notifyListeners();
  }
} 