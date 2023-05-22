

import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  String _searchText = '';
  bool _isSearching = false;

  void setIsSearching(bool value)
  {
    _isSearching = value;
    notifyListeners();
  }

  String get searchText => _searchText;
  bool get isSearching => _isSearching;

  void setSearchText(String text) {
    _searchText = text;
    notifyListeners();
  }
}