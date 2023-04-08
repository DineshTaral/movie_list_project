import 'package:flutter/cupertino.dart';
import 'package:movies_list_project/api_client/api_client.dart';
import 'package:movies_list_project/constants/api_constants.dart';
import 'package:movies_list_project/models/latest_movie_model.dart';
import 'package:rxdart/rxdart.dart';

class LatestMoviesBloc {
  final _latestMoviesStreamController = BehaviorSubject<LatestMovieModel>();

  Stream<LatestMovieModel> get getPopularMoviesStream =>
      _latestMoviesStreamController.stream;
  final _apiClient = ApiClient();

  fetchLatestMovie() {
    _apiClient.getApi(url: latestMoviesListApi).then((value) {
      if (value.statusCode == 200) {
        _latestMoviesStreamController.sink
            .add(LatestMovieModel.fromJson(value.data));
      }
    }).catchError((onError) {
      debugPrint("error in fetch latest movie api $onError");
    });
  }
}
