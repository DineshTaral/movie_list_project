import 'package:flutter/material.dart';
import 'package:movies_list_project/models/popular_movies_model.dart';
import 'package:movies_list_project/theme/app_text_styles.dart';
import 'package:movies_list_project/widgets/movie_details_widget.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Results results = ModalRoute.of(context)!.settings.arguments as Results;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "${results.title}",
          style: robotoBold18,
        ),
      ),
      body: MovieDetailsWidget(
        title: results.title,
        adult: results.adult,
        image: results.posterPath,
        language: results.originalLanguage,
        overview: results.overview,
        releaseDate: results.releaseDate,
        status: "Released",
        voteAvg: results.voteAverage,
        voteCount: results.voteCount,
      ),
    );
  }
}
