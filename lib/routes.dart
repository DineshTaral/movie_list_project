import 'package:flutter/cupertino.dart';
import 'package:movies_list_project/constants/screen_name_constants.dart';
import 'package:movies_list_project/screens/movie_details_screen.dart';
import 'package:movies_list_project/screens/movies_main_screen.dart';
import 'package:page_transition/page_transition.dart';

Route<dynamic> generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case MOVIE_DETAILS_SCREEN :return customPageTransition(widget: const MovieDetailsScreen(), settings: settings);
    default: return customPageTransition(settings: settings,widget:const  MoviesMainScreen());
  }
}

customPageTransition(
    {required Widget widget, required RouteSettings settings}) {
  return PageTransition(child: widget,
      type: PageTransitionType.rightToLeft,
      settings: settings,
      duration: const Duration(milliseconds: 300),
  reverseDuration: const Duration(milliseconds: 300));
}