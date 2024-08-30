import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_app_news_c11_fri/model/SourceResponse.dart';
import 'package:flutter_app_news_c11_fri/repository/sources/source_data_sources.dart';
import 'package:flutter_app_news_c11_fri/repository/sources/source_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SourceRepository)
class SourceRepositoryImpl implements SourceRepository {
  SourceRemoteDataSource remoteDataSource;
  SourceLocalDataSource localDataSource;

  SourceRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<SourceResponse?> getSources(String categoryId) async {
    var checkResult = await Connectivity().checkConnectivity();
    if (checkResult == ConnectivityResult.wifi ||
        checkResult == ConnectivityResult.mobile) {
      // internet
      var sourceResponse = await remoteDataSource.getSources(categoryId);
      localDataSource.saveSources(sourceResponse, categoryId);
      return sourceResponse;
    } else {
      // no internet
      var sourceResponse = await localDataSource.getSources(categoryId);
      return sourceResponse;
    }
  }
}
