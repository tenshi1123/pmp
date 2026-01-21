import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmp_english/app.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:pmp_english/blocs/socket/socket_cubit.dart';
import 'package:pmp_english/core/localization/language_cubit.dart';
import 'package:pmp_english/core/localization/language_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final languageService = LanguageService();
  await languageService.load();
  await initializeDateFormatting('vi_VN', null);
  await initializeDateFormatting('en_US', null);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    await initializeDateFormatting();

    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => SocketCubit(),
          ),
          // ⭐ THÊM DÒNG NÀY
          BlocProvider(
            create: (_) => LanguageCubit(),
          ),
        ],
        child: const App(),
      ),
    );
  });
}
