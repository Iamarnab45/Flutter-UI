import 'package:flutter/foundation.dart';
import '../model/post_model.dart';
import '../repository/api_client.dart';

class PostProvider with ChangeNotifier {
  final ApiClient _apiClient;
  List<PostModel> _posts = [];
  bool _isLoading = false;
  String? _error;

  PostProvider(this._apiClient);

  List<PostModel> get posts => _posts;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchPosts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await _apiClient.get('/posts');
      final data = _apiClient.parseResponse(response);
      _posts = (data as List)
          .map((json) => PostModel.fromJson(json))
          .toList();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> approvePost(String postId) async {
    try {
      await _apiClient.put('/posts/$postId/approve', body: {});
      await fetchPosts(); // Refresh the posts list
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> rejectPost(String postId) async {
    try {
      await _apiClient.put('/posts/$postId/reject', body: {});
      await fetchPosts(); // Refresh the posts list
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }
} 