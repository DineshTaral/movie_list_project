import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_list_project/routes.dart';
import 'package:movies_list_project/screens/movies_main_screen.dart';
import 'package:movies_list_project/services/singleton_service.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return StreamBuilder<bool>(
            stream: SingletonService().themeBloc.getThemeStatusStream,
            builder: (context, snapshot) {
              return MaterialApp(
                title: 'Zigsaw Test',
                onGenerateRoute: generateRoutes,
                theme: ThemeData(
                    brightness: snapshot.data ?? true
                        ? Brightness.light
                        : Brightness.dark,
                    cardColor:
                        snapshot.data ?? true ? Colors.white : Colors.black),
                debugShowCheckedModeBanner: false,
                home: MoviesMainScreen(),
              );
            });
      },
    );
  }
}
