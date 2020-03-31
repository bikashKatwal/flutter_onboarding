import 'package:flutter/material.dart';

class PageModel {
  final imageUrl;
  final title;
  final body;
  List<Color> titleGradient = [];

  PageModel({this.imageUrl, this.title, this.body, this.titleGradient});
}

List<List<Color>> gradients = [
  [Color(0xFF9708CC), Color(0xFF43CBFF)],
  [Color(0xFFE2859F), Color(0xFFFCCF31)],
  [Color(0xFF5EFCE8), Color(0xFF736EFE)],
];
