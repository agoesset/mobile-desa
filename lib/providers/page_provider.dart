import 'package:flutter/foundation.dart';
import '../models/page.dart';
import '../services/page_service.dart';
import '../utils/constants.dart';
import 'base_state.dart';

class PageProvider extends ChangeNotifier {
  final PageService _pageService;
  BaseState<List<PageModel>> _state = BaseState.initial();
  BaseState<PageModel> _pageDetailState = BaseState.initial();

  PageProvider({PageService? pageService})
      : _pageService = pageService ?? PageService();

  BaseState<List<PageModel>> get state => _state;
  BaseState<PageModel> get pageDetailState => _pageDetailState;

  Future<void> loadPages() async {
    try {
      _state = _state.copyWith(status: Status.loading);
      notifyListeners();

      final pages = await _pageService.getAll();
      _state = BaseState.success(pages);
    } catch (e) {
      _state = BaseState.error(e.toString());
      debugPrint('Error loading pages: $e');
    }
      notifyListeners();
  }

  Future<void> loadPageDetail(String slug) async {
    try {
      _pageDetailState = _pageDetailState.copyWith(status: Status.loading);
      notifyListeners();

      final page = await _pageService.getBySlug(slug);
      _pageDetailState = BaseState.success(page);
    } catch (e) {
      _pageDetailState = BaseState.error(e.toString());
      debugPrint('Error loading page detail: $e');
    }
      notifyListeners();
  }
} 