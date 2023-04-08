import 'package:flutter/material.dart';
import 'package:movies_list_project/bloc/latest_movies_bloc.dart';
import 'package:movies_list_project/constants/dimensions.dart';
import 'package:movies_list_project/models/latest_movie_model.dart';
import 'package:movies_list_project/widgets/loading_view_widget.dart';
import 'package:movies_list_project/widgets/movie_details_widget.dart';

class LatestMovieScreen extends StatelessWidget {
  LatestMovieScreen({Key? key}) : super(key: key);
  final _latestMoviesBloc = LatestMoviesBloc();
  final commonVertSpace = const SizedBox(
    height: Dimensions.padding8,
  );

  @override
  Widget build(BuildContext context) {
    _latestMoviesBloc.fetchLatestMovie();
    return StreamBuilder<LatestMovieModel>(
        stream: _latestMoviesBloc.getPopularMoviesStream,
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? const LoadingViewWidget()
              : MovieDetailsWidget(
                  voteCount: snapshot.data!.voteCount,
                  voteAvg: snapshot.data!.voteAverage,
                  status: snapshot.data!.status,
                  releaseDate: snapshot.data!.releaseDate,
                  overview: snapshot.data!.overview,
                  language: snapshot.data!.originalLanguage,
                  image: snapshot.data!.posterPath,
                  adult: snapshot.data!.adult,
                  title: snapshot.data!.title,
                );
        });
  }
}
