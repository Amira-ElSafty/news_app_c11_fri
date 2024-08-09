import 'package:flutter/material.dart';
import 'package:flutter_app_news_c11_fri/api/api_manger.dart';
import 'package:flutter_app_news_c11_fri/app_colors.dart';
import 'package:flutter_app_news_c11_fri/home/news/news_item.dart';
import 'package:flutter_app_news_c11_fri/model/NewsResponse.dart';
import 'package:flutter_app_news_c11_fri/model/SourceResponse.dart';

class NewsWidget extends StatelessWidget {
  Source source;

  NewsWidget({required this.source});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.getNewsBySourceId(source.id ?? ''),
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
                      ApiManager.getNewsBySourceId(source.id ?? "");
                    },
                    child: Text('Try again'))
              ],
            );
          }
          if (snapshot.data!.status != 'ok') {
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getNewsBySourceId(source.id ?? "");
                    },
                    child: Text('Try again'))
              ],
            );
          }
          var newsList = snapshot.data!.articles!;
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(
                news: newsList[index],
              );
            },
            itemCount: newsList.length,
          );
        });
  }
}
