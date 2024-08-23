import 'package:flutter/material.dart';
import 'package:flutter_app_news_c11_fri/app_colors.dart';
import 'package:flutter_app_news_c11_fri/di/di.dart';
import 'package:flutter_app_news_c11_fri/home/category/cubit/category_details_view_model.dart';
import 'package:flutter_app_news_c11_fri/home/category/cubit/source_states.dart';
import 'package:flutter_app_news_c11_fri/home/tabs/tab_widget.dart';
import 'package:flutter_app_news_c11_fri/model/Category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetails extends StatefulWidget {
  Category category;

  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = getIt<CategoryDetailsViewModel>();

  /// field injection

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailsViewModel, SourceStates>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is SourceLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryLightColor,
              ),
            );
          } else if (state is SourceErrorState) {
            return Column(
              children: [
                Text(
                  state.errorMessage,
                ),
                ElevatedButton(
                    onPressed: () {
                      viewModel.getSources(widget.category.id);
                    },
                    child: Text('Try again'))
              ],
            );
          } else if (state is SourceSuccessState) {
            return TabWidget(sourcesList: state.sourcesList);
          }
          return Container();

          /// un reachable
        });

    // FutureBuilder<SourceResponse?>(
    //   future: ApiManager.getSources(widget.category.id),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(
    //         child: CircularProgressIndicator(
    //           color: AppColors.primaryLightColor,
    //         ),
    //       );
    //     } else if (snapshot.hasError) {
    //       return Column(
    //         children: [
    //           Text('Something went wrong'),
    //           ElevatedButton(
    //               onPressed: () {
    //                 ApiManager.getSources(widget.category.id);
    //                 setState(() {});
    //               },
    //               child: Text('Try again'))
    //         ],
    //       );
    //     }
    //
    //     /// server => success , error
    //     if (snapshot.data!.status != 'ok') {
    //       return Column(
    //         children: [
    //           Text(snapshot.data!.message!),
    //           ElevatedButton(
    //               onPressed: () {
    //                 ApiManager.getSources(widget.category.id);
    //                 setState(() {});
    //               },
    //               child: Text('Try again'))
    //         ],
    //       );
    //     }
    //     var sourcesList = snapshot.data!.sources!;
    //     return TabWidget(sourcesList: sourcesList);
    //   });
  }
}
