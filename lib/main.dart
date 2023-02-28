import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:penjual/const/local_data.dart';
import 'package:penjual/presentasi/controller/login_controller.dart';
import 'package:penjual/presentasi/controller/profile_controller.dart';
import 'package:penjual/presentasi/controller/recap_controller.dart';
import 'package:penjual/presentasi/page/login_view.dart';
import 'package:provider/provider.dart';

import 'const/main_app.dart';
import 'presentasi/page/home_view.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark),
  );

  final data = await LocalData().loadToken();

  runApp(MyApp(
    data: data,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.data});

  final String? data;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProfileController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginController(),
        ),
        ChangeNotifierProvider(
          create: (context) => RecapController(),
        )
      ],
      child: MaterialApp(
          title: "E-Kantin Delivery",
          debugShowCheckedModeBanner: false,
          home: data != null ? const HomeView() : const LoginView(),
          theme: ThemeData.light().copyWith(
              primaryColor: purple,
              textTheme: GoogleFonts.interTextTheme(),
              backgroundColor: bg,
              appBarTheme: const AppBarTheme(
                  backgroundColor: bg,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.transparent,
                      statusBarIconBrightness: Brightness.dark,
                      systemNavigationBarColor: Colors.transparent,
                      systemNavigationBarIconBrightness: Brightness.dark)))),
    );
  }
}
