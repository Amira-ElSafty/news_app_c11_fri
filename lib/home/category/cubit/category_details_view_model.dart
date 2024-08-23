import 'package:bloc/bloc.dart';
import 'package:flutter_app_news_c11_fri/home/category/cubit/source_states.dart';
import 'package:flutter_app_news_c11_fri/repository/sources/source_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoryDetailsViewModel extends Cubit<SourceStates> {
  SourceRepository sourceRepository;

  CategoryDetailsViewModel({required this.sourceRepository})
      : super(SourceLoadingState());

  //todo: hold data - handle logic

  void getSources(String categoryId) async {
    try {
      emit(SourceLoadingState());
      var response = await sourceRepository.getSources(categoryId);
      if (response?.status == 'error') {
        emit(SourceErrorState(errorMessage: response!.message!));
        return;
      }
      if (response?.status == 'ok') {
        emit(SourceSuccessState(sourcesList: response!.sources!));
        return;
      }
    } catch (e) {
      emit(SourceErrorState(errorMessage: e.toString()));
    }
  }
}
