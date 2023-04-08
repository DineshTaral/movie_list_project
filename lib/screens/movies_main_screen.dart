import 'package:flutter/material.dart';
import 'package:movies_list_project/bloc/navigation_bloc.dart';
import 'package:movies_list_project/constants/dimensions.dart';
import 'package:movies_list_project/screens/latest_movies_screen.dart';
import 'package:movies_list_project/screens/popular_movies_list_screen.dart';
import 'package:movies_list_project/services/singleton_service.dart';
import 'package:movies_list_project/theme/app_colors.dart';
import 'package:movies_list_project/theme/app_text_styles.dart';

class MoviesMainScreen extends StatefulWidget {
  const MoviesMainScreen({Key? key}) : super(key: key);

  @override
  State<MoviesMainScreen> createState() => _MoviesMainScreenState();
}

class _MoviesMainScreenState extends State<MoviesMainScreen> {
  final _navigationBloc = NavigationBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SingletonService().popularMoviesBloc.getData(page: 1);
    _navigationBloc.setNavIndex(index: 0);
  }

  @override
  Widget build(BuildContext context) {
    Dimensions.deviceWidth = MediaQuery.of(context).size.width;
    Dimensions.deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Zigsaw Movie Test",
          style: robotoNormal18,
        ),
        actions: [
          StreamBuilder<bool>(
              stream: SingletonService().themeBloc.getThemeStatusStream,
              builder: (ctx, snapshot) {
                return Switch(
                    value: snapshot.data ?? true,
                    activeColor: snapshot.data ?? true ? darkColor : lightColor,
                    onChanged: (val) =>
                        SingletonService().themeBloc.changeTheme());
              })
        ],
      ),
      bottomNavigationBar: StreamBuilder<int>(
          stream: _navigationBloc.getSelectedNavStream,
          builder: (context, snapshot) {
            return BottomNavigationBar(
              onTap: (v) {
                _navigationBloc.setNavIndex(index: v);
              },
              currentIndex: snapshot.data ?? 0,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/popular.png")),
                  label: 'Popular',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/latest.png")),
                  label: 'Latest',
                ),
              ],
            );
          }),
      body: StreamBuilder<int>(
        stream: _navigationBloc.getSelectedNavStream,
        builder: (ctx, snapshot) {
          return !snapshot.hasData || snapshot.data == 0
              ? const PopularMoviesList()
              : LatestMovieScreen();
        },
      ),
    );
  }
}
