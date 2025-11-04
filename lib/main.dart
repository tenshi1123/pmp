import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmp_english/app.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:pmp_english/blocs/socket/socket_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    initializeDateFormatting().then((_) => runApp(
          MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => SocketCubit()
                  ..connect(site: "pmpenglish", role: "teachers", userId: "1"),
              ),
            ],
            child: const App(),
          ),
        ));
  });
}
