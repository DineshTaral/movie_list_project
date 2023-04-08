import 'package:movies_list_project/bloc/popular_movies_bloc.dart';
import 'package:movies_list_project/bloc/theme_bloc.dart';

class SingletonService {
  static final SingletonService _singletonService =
      SingletonService._instance();

  factory SingletonService() => _singletonService;

  PopularMoviesBloc popularMoviesBloc = PopularMoviesBloc();
  ThemeBloc themeBloc = ThemeBloc();

  SingletonService._instance();
}
