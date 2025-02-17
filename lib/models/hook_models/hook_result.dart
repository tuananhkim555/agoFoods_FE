
import 'package:agofoods/models/categories.dart';
import 'package:flutter/material.dart';

class FetchHook {
  final List<CategoriesModel>? data;
  final bool isLoading;
  final Exception? error;
  final VoidCallback? refetch;

  FetchHook({
    required this.data,
    required this.isLoading,
    this.error,
    this.refetch,
  });
}