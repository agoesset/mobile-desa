import 'package:flutter/foundation.dart';
import '../models/post.dart';
import '../services/post_service.dart';
import '../utils/constants.dart';
import '../utils/api_exception.dart';
import 'base_state.dart';

class PostProvider extends ChangeNotifier {
  final PostService _postService;
  BaseState<List<Post>> _state = BaseState.initial();
  List<Post> _homePosts = [];

  PostProvider({PostService? postService})
      : _postService = postService ?? PostService();

  BaseState<List<Post>> get state => _state;
  List<Post> get homePosts => _homePosts;

  Future<void> loadPosts() async {
    try {
      _state = _state.copyWith(status: Status.loading);
      notifyListeners();

      final posts = await _postService.getAll();
      
      _state = _state.copyWith(
        status: Status.success,
        data: posts,
      );
    } catch (e) {
      debugPrint('Error loading posts: $e');
      _state = _state.copyWith(
        status: Status.error,
        errorMessage: e.toString(),
      );
    } finally {
      notifyListeners();
    }
  }

  Future<void> loadHomePosts() async {
    try {
      _state = _state.copyWith(status: Status.loading);
      notifyListeners();

      final posts = await _postService.getHomePagePosts();
      _homePosts = posts;
      
      _state = BaseState.success(posts);
    } catch (e) {
      final errorMessage = e is ApiException ? e.message : AppConstants.defaultErrorMessage;
      _state = BaseState.error(errorMessage);
      _homePosts = [];
      debugPrint('Error loading home posts: $e');
    }
    notifyListeners();
  }

  Future<void> loadPostBySlug(String slug) async {
    try {
      _state = _state.copyWith(status: Status.loading);
      notifyListeners();

      final post = await _postService.getBySlug(slug);
      
      _state = _state.copyWith(
        status: Status.success,
        data: [post],
      );
    } catch (e) {
      debugPrint('Error loading post by slug: $e');
      _state = _state.copyWith(
        status: Status.error,
        errorMessage: e.toString(),
      );
    } finally {
      notifyListeners();
    }
  }

  Future<void> searchPosts(String keyword) async {
    try {
      _state = _state.copyWith(status: Status.loading);
      notifyListeners();

      final posts = await _postService.searchPosts(keyword);
      _state = BaseState.success(posts);
    } catch (e) {
      final errorMessage = e is ApiException ? e.message : AppConstants.defaultErrorMessage;
      _state = BaseState.error(errorMessage);
      debugPrint('Error searching posts: $e');
    }
    notifyListeners();
  }
} 