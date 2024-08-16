import 'package:flutter/material.dart';
import 'package:flutter_app_news_c11_fri/api/api_manger.dart';
import 'package:flutter_app_news_c11_fri/model/SourceResponse.dart';

class CategoryDetailsViewModel extends ChangeNotifier {
  //todo: hold data - handle logic
  List<Source>? sourcesList;

  String? errorMessage;

  void getSources(String categoryId) async {
    sourcesList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManager.getSources(categoryId);
      if (response?.status == 'error') {
        errorMessage = response!.message;
      } else {
        sourcesList = response!.sources;
      }
    } catch (e) {
      errorMessage = 'Error Loading Sources List.';
    }
    notifyListeners();
  }
}
