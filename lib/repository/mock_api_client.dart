import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_client.dart';

class MockApiClient implements ApiClient {
  @override
  Future<http.Response> post(
    String endpoint, {
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    if (endpoint == 'login') {
      // Simulate a successful login
      return http.Response(jsonEncode({'token': 'mock_token_123'}), 200);
    } else if (endpoint == 'users') {
      // Simulate successful registration
      return http.Response(jsonEncode({'message': 'User registered'}), 201);
    }
    // Simulate posting new data for posts, events, or jobs
    if (endpoint == '/posts' || endpoint == '/events' || endpoint == '/jobs') {
       return http.Response(jsonEncode({'message': 'Created successfully', 'id': 'new_mock_id'}), 201);
    }
    return http.Response('Not found', 404);
  }

  @override
  Future<http.Response> get(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    if (endpoint == '/posts') {
      return http.Response(jsonEncode([
        {'id': '1', 'title': 'Mock Post 1', 'content': 'This is mock post 1.'},
        {'id': '2', 'title': 'Mock Post 2', 'content': 'This is mock post 2.'},
      ]), 200);
    } else if (endpoint == '/events') {
       return http.Response(jsonEncode([
        {'id': '101', 'title': 'Mock Event 1', 'date': '2024-12-01', 'location': 'Online'},
        {'id': '102', 'title': 'Mock Event 2', 'date': '2024-12-15', 'location': 'Campus'},
      ]), 200);
    } else if (endpoint == '/jobs') {
       return http.Response(jsonEncode([
        {'id': '201', 'title': 'Mock Job 1', 'company': 'Mock Co.', 'location': 'Remote'},
        {'id': '202', 'title': 'Mock Job 2', 'company': 'Another Mock LLC', 'location': 'Hybrid'},
      ]), 200);
    }
    return http.Response('Not found', 404);
  }

  @override
  Future<http.Response> put(
    String endpoint, {
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));
     // Simulate updating data for posts, events, or jobs
    if (endpoint.startsWith('/posts/') || endpoint.startsWith('/events/') || endpoint.startsWith('/jobs/')) {
       return http.Response(jsonEncode({'message': 'Updated successfully'}), 200);
    }
    return http.Response('Not found', 404);
  }

  @override
  Future<http.Response> delete(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));
     // Simulate deleting data for posts, events, or jobs
    if (endpoint.startsWith('/posts/') || endpoint.startsWith('/events/') || endpoint.startsWith('/jobs/')) {
       return http.Response(jsonEncode({'message': 'Deleted successfully'}), 200);
    }
    return http.Response('Not found', 404);
  }

  @override
  dynamic parseResponse(http.Response response) {
    return jsonDecode(response.body);
  }

  @override
  String parseError(http.Response response) {
    return response.body;
  }

  @override
  void dispose() {
    // Nothing to dispose in mock client
  }
} 