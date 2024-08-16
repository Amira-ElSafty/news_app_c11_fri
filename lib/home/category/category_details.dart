import 'package:flutter/material.dart';
import 'package:flutter_app_news_c11_fri/app_colors.dart';
import 'package:flutter_app_news_c11_fri/home/category/category_details_view_model.dart';
import 'package:flutter_app_news_c11_fri/home/tabs/tab_widget.dart';
import 'package:flutter_app_news_c11_fri/model/Category.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  Category category;

  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<CategoryDetailsViewModel>(
            builder: (context, viewModel, child) {
          if (viewModel.errorMessage != null) {
            return Column(
              children: [
                Text(viewModel.errorMessage!),
                ElevatedButton(
                    onPressed: () {
                      viewModel.getSources(widget.category.id);
                    },
                    child: Text('Try again'))
              ],
            );
          } else if (viewModel.sourcesList == null) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryLightColor,
              ),
            );
          } else {
            return TabWidget(sourcesList: viewModel.sourcesList!);
          }
        })
        // FutureBuilder<SourceResponse?>(
        //     future: ApiManager.getSources(widget.category.id),
        //     builder: (context, snapshot) {
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return Center(
        //           child: CircularProgressIndicator(
        //             color: AppColors.primaryLightColor,
        //           ),
        //         );
        //       } else if (snapshot.hasError) {
        //         return Column(
        //           children: [
        //             Text('Something went wrong'),
        //             ElevatedButton(
        //                 onPressed: () {
        //                   ApiManager.getSources(widget.category.id);
        //                   setState(() {});
        //                 },
        //                 child: Text('Try again'))
        //           ],
        //         );
        //       }
        //
        //       /// server => success , error
        //       if (snapshot.data!.status != 'ok') {
        //         return Column(
        //           children: [
        //             Text(snapshot.data!.message!),
        //             ElevatedButton(
        //                 onPressed: () {
        //                   ApiManager.getSources(widget.category.id);
        //                   setState(() {});
        //                 },
        //                 child: Text('Try again'))
        //           ],
        //         );
        //       }
        //       var sourcesList = snapshot.data!.sources!;
        //       return TabWidget(sourcesList: sourcesList);
        //     }),
        );
  }
}
