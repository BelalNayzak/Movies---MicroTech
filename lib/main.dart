import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micro_tech_movies/features/movie_details/presentation/bloc/movie_details_bloc.dart';
import 'package:micro_tech_movies/features/movies_search/presentation/bloc/movies_search_bloc.dart';
import 'package:micro_tech_movies/features/movies_search/presentation/pages/movies_search_screen.dart';

import 'package:sizer/sizer.dart';
import 'package:micro_tech_movies/core/utils/debugging_utils/debugging_helper.dart';

import 'core/constants/assets_refs.dart';
import 'core/constants/font_sizes.dart';
import 'core/navigator/router.dart';
import 'core/di/injection.dart' as di;
import 'core/constants/colors.dart';
import 'core/constants/data.dart';
import 'core/utils/observer_utils/bloc_observer_utils.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
  );

  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: colorPrimary));
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => di.sl<MoviesSearchBloc>()),
        BlocProvider(create: (BuildContext context) => di.sl<MovieDetailsBloc>()),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            builder: BotToastInit(),
            navigatorKey: navigatorKey,
            title: appName,
            theme: ThemeData(
              snackBarTheme: const SnackBarThemeData(
                contentTextStyle: TextStyle(color: colorWhite),
              ),
              appBarTheme: AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle.dark,
                titleTextStyle: TextStyle(
                  color: colorWhite,
                  fontSize: FontSizes.medium,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w700,
                ),
                iconTheme: const IconThemeData(color: colorWhite),
                actionsIconTheme: const IconThemeData(color: colorWhite),
                backgroundColor: colorPrimary,
                centerTitle: true,
              ),
              scaffoldBackgroundColor: colorWhite,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedItemColor: colorPrimary,
                unselectedItemColor: colorGrey,
              ),
              brightness: Brightness.light,
              fontFamily: font_sofia,
              colorScheme: ColorScheme.fromSwatch().copyWith(
                secondary: colorAccent,
                primary: colorPrimary,
                brightness: Brightness.light,
              ),
            ),
            darkTheme: ThemeData(
              snackBarTheme: const SnackBarThemeData(
                contentTextStyle: TextStyle(color: colorWhite),
              ),
              appBarTheme: AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle.light,
                titleTextStyle: TextStyle(
                  color: colorGrey.shade200,
                  fontSize: FontSizes.medium,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w700,
                ),
                iconTheme: IconThemeData(color: colorGrey.shade200),
                actionsIconTheme: IconThemeData(color: colorGrey.shade200),
                backgroundColor: colorPrimaryDarkMode,
                centerTitle: true,
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedItemColor: colorWhite,
                unselectedItemColor: colorGrey,
              ),
              brightness: Brightness.dark,
              scaffoldBackgroundColor: colorBlack,
              fontFamily: font_sofia,
              colorScheme: ColorScheme.fromSwatch().copyWith(
                secondary: colorAccentDarkMode,
                primary: colorPrimaryDarkMode,
                brightness: Brightness.dark,
              ),
            ),
            debugShowCheckedModeBanner: false,
            color: colorPrimary,
            routes: Routing.appRoutes(context),
            initialRoute: MoviesSearchScreen.id,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}