import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/page.dart' show PageModel;
import 'base_state.dart';

class PagesProvider extends ChangeNotifier {
  static const String baseUrl = 'https://desa-api.aguss.id/api/public/pages';
  
  late BaseState<List<PageModel>> _state;
  late BaseState<PageModel> _pageDetailState;

  PagesProvider() {
    _state = BaseState<List<PageModel>>.initial();
    _pageDetailState = BaseState<PageModel>.initial();
  }

  BaseState<List<PageModel>> get state => _state;
  BaseState<PageModel> get pageDetailState => _pageDetailState;

  Future<void> loadPages() async {
    try {
      _state = BaseState<List<PageModel>>.loading();
      notifyListeners();

      final response = await http.get(Uri.parse(baseUrl));
      
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        if (responseData['success'] == true && responseData['data'] is List) {
          final List<dynamic> pagesData = responseData['data'];
          final List<PageModel> pages = pagesData
              .map((json) => PageModel.fromJson(json as Map<String, dynamic>))
              .toList();
          
          // Sort pages by ID to maintain consistent order
          pages.sort((a, b) => a.id.compareTo(b.id));
          
          _state = BaseState<List<PageModel>>.success(pages);
        } else {
          _state = BaseState<List<PageModel>>.error(responseData['message'] ?? 'Failed to load pages');
        }
      } else {
        _state = BaseState<List<PageModel>>.error('Failed to load pages');
      }
    } catch (e) {
      _state = BaseState<List<PageModel>>.error(e.toString());
    }
    notifyListeners();
  }

  Future<void> loadPageDetail(String slug) async {
    try {
      _pageDetailState = BaseState<PageModel>.loading();
      notifyListeners();

      final response = await http.get(Uri.parse('$baseUrl/$slug'));
      
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        if (responseData['success'] == true && responseData['data'] is Map<String, dynamic>) {
          final Map<String, dynamic> pageData = responseData['data'];
          final PageModel page = PageModel.fromJson(pageData);
          _pageDetailState = BaseState<PageModel>.success(page);
        } else {
          _pageDetailState = BaseState<PageModel>.error(responseData['message'] ?? 'Failed to load page detail');
        }
      } else {
        _pageDetailState = BaseState<PageModel>.error('Failed to load page detail');
      }
    } catch (e) {
      _pageDetailState = BaseState<PageModel>.error(e.toString());
    }
    notifyListeners();
  }
} 