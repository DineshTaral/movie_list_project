import 'package:flutter/cupertino.dart';
import 'package:movies_list_project/api_client/api_client.dart';
import 'package:movies_list_project/constants/api_constants.dart';
import 'package:movies_list_project/models/popular_movies_model.dart';
import 'package:movies_list_project/widgets/custom_progress_dialog.dart';
import 'package:rxdart/rxdart.dart';

class PopularMoviesBloc {
  final _apiClient = ApiClient();
  final _customProgressDialog = CustomProgressDialog();
  final _popularMoviesStreamController = BehaviorSubject<MoviesListModel>();

  Stream<MoviesListModel> get getPopularMoviesStream =>
      _popularMoviesStreamController.stream;

  getData({required int page, BuildContext? context}) {
    if (_popularMoviesStreamController.hasValue) {
      _customProgressDialog.showProgressDialog(context!);
    }
    _apiClient.getApi(url: "$popularMoviesListApi&page=$page").then((value) {
      if (value.statusCode == 200) {
        if (_popularMoviesStreamController.hasValue) {
          _popularMoviesStreamController.value.page = value.data['page'];
          _popularMoviesStreamController.value.results!.addAll(value
              .data['results']
              .map<Results>((e) => Results.fromJson(e))
              .toList());
          _popularMoviesStreamController.sink
              .add(_popularMoviesStreamController.value);
        } else {
          _popularMoviesStreamController.sink
              .add(MoviesListModel.fromJson(value.data));
        }
        _customProgressDialog.dismiss(context!);
      }
    }).catchError((onError) {
      debugPrint("error in popular movies api $onError");
      if (_popularMoviesStreamController.hasValue) {
        _customProgressDialog.dismiss(context!);
      }
    });
  }
}
