import 'package:flutter/material.dart';
import 'package:flutter_app_news_c11_fri/api/api_manger.dart';
import 'package:flutter_app_news_c11_fri/app_colors.dart';
import 'package:flutter_app_news_c11_fri/home/tabs/tab_widget.dart';
import 'package:flutter_app_news_c11_fri/model/SourceResponse.dart';

class CategoryDetails extends StatefulWidget {
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
        future: ApiManager.getSources(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryLightColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text('Something went wrong'),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getSources();
                      setState(() {});
                    },
                    child: Text('Try again'))
              ],
            );
          }

          /// server => success , error
          if (snapshot.data!.status != 'ok') {
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getSources();
                      setState(() {});
                    },
                    child: Text('Try again'))
              ],
            );
          }
          var sourcesList = snapshot.data!.sources!;
          return TabWidget(sourcesList: sourcesList);
        });
  }
}
