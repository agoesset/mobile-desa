import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/photo.dart';
import 'base_state.dart';

class PhotoProvider with ChangeNotifier {
  final String baseUrl = 'https://desa-api.aguss.id/api';
  BaseState<List<Photo>> _state = BaseState.initial();
  List<Photo> _photos = [];

  BaseState<List<Photo>> get state => _state;
  List<Photo> get photos => _photos;

  Future<void> loadPhotos() async {
    _state = BaseState.loading();
    notifyListeners();

    try {
      final response = await http.get(Uri.parse('$baseUrl/public/photos'));
      print('API Response Status: ${response.statusCode}');
      print('API Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['success'] == true) {
          final List<dynamic> photosJson = data['data']['data'];
          _photos = photosJson.map((json) => Photo.fromJson(json)).toList();
          print('Loaded ${_photos.length} photos');
          _state = BaseState.success(_photos);
        } else {
          print('API returned success: false');
          _state = BaseState.error('Failed to load photos: ${data['message']}');
        }
      } else {
        print('API Error: ${response.statusCode}');
        _state = BaseState.error('Failed to load photos: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception while loading photos: $e');
      _state = BaseState.error('Failed to load photos: $e');
    }

    notifyListeners();
  }
} 