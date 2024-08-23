import 'package:flutter_app_news_c11_fri/model/SourceResponse.dart';

abstract class SourceRemoteDataSource {
  Future<SourceResponse?> getSources(String categoryId);
}

abstract class SourceLocalDataSource {}
