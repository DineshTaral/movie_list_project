import 'package:flutter/material.dart';
import 'package:movies_list_project/constants/api_constants.dart';
import 'package:movies_list_project/constants/dimensions.dart';
import 'package:movies_list_project/models/popular_movies_model.dart';
import 'package:movies_list_project/theme/app_colors.dart';
import 'package:movies_list_project/theme/app_text_styles.dart';

class MovieCardItem extends StatelessWidget {
  final Results results;

  const MovieCardItem({required this.results, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Dimensions.padding8),
      padding: const EdgeInsets.all(Dimensions.padding8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor,
        boxShadow: [boxShadow1],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: Dimensions.deviceWidth! * .35,
            width: Dimensions.deviceWidth! * .231,
            //image ratio is 440*660
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    image: NetworkImage("$mediaBaseUrl${results.posterPath}"),
                    fit: BoxFit.fill)),
          ),
          const SizedBox(
            width: Dimensions.padding8,
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${results.title}",
                style: robotoNormal18,
              ),
              const SizedBox(
                height: Dimensions.padding8,
              ),
              detailsWidget(title: "Release", val: "${results.releaseDate}"),
              detailsWidget(
                  title: "Adult", val: results.adult ?? false ? "Yes" : "No"),
              detailsWidget(title: "Vote avg", val: "${results.voteCount}"),
              detailsWidget(title: "Votes", val: "${results.voteCount}"),
              detailsWidget(
                  title: "Language", val: "${results.originalLanguage}"),
            ],
          ))
        ],
      ),
    );
  }

  detailsWidget({required String title, required String val}) {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: Text(
              title,
              style: robotoBold16,
            )),
        Expanded(
            flex: 4,
            child: Text(
              val,
              style: robotoNormal16,
            )),
      ],
    );
  }
}
