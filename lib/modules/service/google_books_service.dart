import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://www.googleapis.com/books/v1/volumes';

  Future<List<dynamic>> fetchBooks(String query, {int maxResults = 40}) async {
    //change to (String query, {int maxResults = 40}) for maximum results of 40 books per search

    final uri = Uri.parse('$baseUrl?q=$query&maxResults=$maxResults');
    //change to final uri = Uri.parse('$baseUrl?q=$query&maxResults=$maxResults'); for more books
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      debugPrint('Fetched Data: ${data['items']}');
      return data['items'] ?? [];
    } else {
      debugPrint('Error: ${response.statusCode} - ${response.body}');
      throw Exception('Failed to load books');
    }
  }
}
