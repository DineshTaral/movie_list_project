import 'package:flutter/material.dart';
import 'package:movies_list_project/constants/dimensions.dart';
import 'package:movies_list_project/constants/screen_name_constants.dart';
import 'package:movies_list_project/models/popular_movies_model.dart';
import 'package:movies_list_project/services/singleton_service.dart';
import 'package:movies_list_project/theme/app_colors.dart';
import 'package:movies_list_project/theme/app_text_styles.dart';
import 'package:movies_list_project/widgets/custom_shimmer_widget.dart';
import 'package:movies_list_project/widgets/movie_card_item.dart';

class PopularMoviesList extends StatelessWidget {
  const PopularMoviesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MoviesListModel>(
        stream: SingletonService().popularMoviesBloc.getPopularMoviesStream,
        builder: (context, snapshot) {
          return ListView(
            padding: const EdgeInsets.symmetric(vertical: Dimensions.padding8),
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, idx) {
                  return !snapshot.hasData
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Dimensions.padding8),
                          child: CustomShimmerWidget(
                              height: Dimensions.deviceWidth! * .45,
                              width: Dimensions.deviceWidth!,
                              borderRadius: 12),
                        )
                      : GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, MOVIE_DETAILS_SCREEN,
                                arguments: snapshot.data!.results![idx]);
                          },
                          child: MovieCardItem(
                            results: snapshot.data!.results![idx],
                          ));
                },
                separatorBuilder: (ctx, idx) {
                  return const SizedBox(
                    height: Dimensions.padding8,
                  );
                },
                itemCount:
                    !snapshot.hasData ? 5 : snapshot.data!.results!.length,
              ),
              const SizedBox(
                height: Dimensions.padding8,
              ),
              if (snapshot.hasData &&
                  snapshot.data!.page != null &&
                  snapshot.data!.totalPages! > snapshot.data!.page!)
                GestureDetector(
                  onTap: () => SingletonService().popularMoviesBloc.getData(
                      page: snapshot.data!.page! + 1, context: context),
                  child: Container(
                    decoration: BoxDecoration(
                        color: loadMoreColor,
                        borderRadius: BorderRadius.circular(8)),
                    height: 40,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(
                        horizontal: Dimensions.deviceWidth! * .25),
                    child: Text(
                      "Load More",
                      style: robotoBold16,
                    ),
                  ),
                ),
            ],
          );
        });
  }
}
