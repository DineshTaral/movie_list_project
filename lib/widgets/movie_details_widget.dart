import 'package:flutter/material.dart';
import 'package:movies_list_project/constants/api_constants.dart';
import 'package:movies_list_project/constants/dimensions.dart';
import 'package:movies_list_project/theme/app_text_styles.dart';

class MovieDetailsWidget extends StatelessWidget {
  String? image, title, language, status, releaseDate, overview;
  num? voteAvg, voteCount;
  bool? adult;

  MovieDetailsWidget(
      {this.overview,
      this.releaseDate,
      this.image,
      this.title,
      this.status,
      this.voteCount,
      this.adult,
      this.language,
      this.voteAvg,
      Key? key})
      : super(key: key);
  final commonVertSpace = const SizedBox(
    height: Dimensions.padding8,
  );

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: Dimensions.padding16),
      children: [
        if (image == null || image!.isEmpty)
          Container(
            width: Dimensions.deviceWidth!,
            height: Dimensions.deviceWidth! * 1.5,
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.image_not_supported),
                commonVertSpace,
                Text(
                  "Image Not Supported",
                  style: robotoBold16,
                )
              ],
            ),
          )
        else
          Container(
            width: Dimensions.deviceWidth!,
            height: Dimensions.deviceWidth! * 1.5,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("$mediaBaseUrl$image"),
                    fit: BoxFit.fill)),
          ),
        commonVertSpace,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.padding8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$title",
                style: robotoBold18,
              ),
              commonVertSpace,
              if (releaseDate != null && releaseDate!.isNotEmpty)
                detailsWidget(title: "Release", val: "$releaseDate"),
              if (adult != null)
                detailsWidget(
                    title: "Adult", val: adult ?? false ? "Yes" : "No"),
              if (voteAvg != null)
                detailsWidget(title: "Vote Avg", val: "$voteAvg"),
              if (voteCount != null)
                detailsWidget(title: "Votes", val: "$voteCount"),
              if (language != null)
                detailsWidget(title: "Language", val: "$language"),
              if (status != null)
                detailsWidget(title: "Status", val: "$status"),
              if(overview!=null&&overview!.isNotEmpty)
              Text(
                "Overview",
                style: robotoBold18,
              ),
              commonVertSpace,
              Text(
                "$overview",
                style: robotoNormal16,
              )
            ],
          ),
        )
      ],
    );
  }

  detailsWidget({required String title, required String val}) {
    return Column(
      children: [
        Row(
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
        ),
        commonVertSpace,
      ],
    );
  }
}
