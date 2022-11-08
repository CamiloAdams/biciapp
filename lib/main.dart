import 'package:biciapp/providers/guides_provider.dart';
import 'package:biciapp/providers/questions_provider.dart';
import 'package:biciapp/providers/score_provider.dart';
import 'package:biciapp/providers/token_provider.dart';
import 'package:biciapp/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:biciapp/constants.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
      systemNavigationBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TokenProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => QuestionsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => GuidesProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ScoreProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bici App',
        theme: ThemeData(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: Colors.white,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                primary: kPrimaryColor,
                maximumSize: const Size(double.infinity, 56),
                minimumSize: const Size(double.infinity, 56),
              ),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              fillColor: kPrimaryLightColor,
              iconColor: kPrimaryColor,
              prefixIconColor: kPrimaryColor,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none,
              ),
            )),
        // home: const WelcomeScreen(),
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.routes,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
