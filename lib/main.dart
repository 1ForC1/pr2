import 'package:pr2/app_router.dart';
import 'package:pr2/common/url_page.dart';
import 'package:pr2/core/db/data_base_helper.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataBaseHelper.instance.init();
  Provider.debugCheckInvalidValueType = null;
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final AppRouter router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.indigo,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF590D82),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(color: Color(0xFF0C056D)),
            backgroundColor: const Color(0xFF47A76A),
          ),
        ),
      ),
      themeMode: ThemeMode.light,
      initialRoute: UrlPage.signIn,
      onGenerateRoute: router.generateRouter,
    );
  }
}

