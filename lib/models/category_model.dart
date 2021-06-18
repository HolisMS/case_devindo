import 'dart:convert';

import 'package:flutter/services.dart';

import 'content.dart';

class CategoryModel {
  final String? title;
  final List<Content>? content;

  CategoryModel({this.title, this.content});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      title: json['title'],
      content:
          (json['content'] as List).map((e) => Content.fromMap(e)).toList(),
    );
  }
}

Future<Stream<CategoryModel>> getDataCategory() async {
  return Stream.fromFuture(rootBundle.loadString('assets/data/category.json'))
      .transform(json.decoder)
      .expand((jsonBody) => (jsonBody as Map)['content']);
}

List<CategoryModel> parseCategory(String? json) {
  if (json == null) {
    return [];
  }
  final List parsed = jsonDecode(json);
  return parsed.map((e) => CategoryModel.fromJson(e)).toList();
}
