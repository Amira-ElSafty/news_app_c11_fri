import 'package:flutter/material.dart';
import 'package:flutter_app_news_c11_fri/app_colors.dart';
import 'package:flutter_app_news_c11_fri/model/SourceResponse.dart';

class TabItem extends StatelessWidget {
  bool isSelected;

  Source source;

  TabItem({required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryLightColor : Colors.transparent,
        border: Border.all(color: AppColors.primaryLightColor, width: 3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        source.name ?? "",
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: isSelected
                ? AppColors.whiteColor
                : AppColors.primaryLightColor),
      ),
    );
  }
}
