import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmp_english/core/localization/language_cubit.dart';
import 'package:pmp_english/l10n/app_localizations.dart';
import 'package:pmp_english/utils/constants/styles.dart';
import 'package:upgrader/upgrader.dart';
import 'modules/splash/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final locale = context.watch<LanguageCubit>().state;
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return UpgradeAlert(
          upgrader: Upgrader(
            durationUntilAlertAgain: const Duration(hours: 6),
          ),
          child: MaterialApp(
            locale: locale,
            supportedLocales: const [
              Locale('vi'),
              Locale('en'),
            ],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            title: 'First Method',
            // You can use the library anywhere in the app even in theme
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: TextTheme(
                bodyLarge: defaultText14M, // Cho Text() bình thường
                bodyMedium: defaultText14M,
                bodySmall: defaultText12M,
                titleLarge: defaultText18B,
                titleMedium: defaultText16B,
                titleSmall: defaultText14B,
                labelLarge: defaultText14B,
                labelSmall: defaultText12M,
              ).apply(
                fontFamily: 'Roboto', // hoặc font bạn đang dùng
                displayColor: Colors.black, // màu cho Text hiển thị
                bodyColor: Colors.black,
              ),
            ),
            builder: (context, child) => MediaQuery(
              data: MediaQuery.of(context).copyWith(boldText: false),
              child: child!,
            ),
            home: const Splshscreen(),
            routes: const <String, WidgetBuilder>{},
          ),
        );
      },
    );
  }
}
