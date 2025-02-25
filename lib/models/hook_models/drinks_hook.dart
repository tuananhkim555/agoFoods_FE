
import 'dart:ui';

import 'package:agofoods/models/drinks_model.dart';

class FetchHook<T> {
  final List<DrinksModel> data;
  final bool isLoading;
  final Exception? error;
  final VoidCallback refetch;

  FetchHook({
    required this.data,
    required this.isLoading,
    required this.error,
    required this.refetch,
  });
}