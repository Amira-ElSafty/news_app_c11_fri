import 'package:flutter_app_news_c11_fri/model/SourceResponse.dart';
import 'package:flutter_app_news_c11_fri/repository/sources/source_data_sources.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SourceLocalDataSource)
class SourceLocalDataSourceImpl implements SourceLocalDataSource {
  @override
  Future<SourceResponse>? getSources(String categoryId) async {
    var box = await Hive.openBox('tabs');
    var data = SourceResponse.fromJson(box.get(categoryId));
    return data;
  }

  @override
  void saveSources(SourceResponse? sourceResponse, String category) async {
    var box = await Hive.openBox('tabs');
    await box.put(category, sourceResponse?.toJson());

    /// map
    box.close();
  }
}
