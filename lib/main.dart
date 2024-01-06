import 'package:flutter/material.dart';
import 'package:locale_loom_app/viewmodels/result_viewmodel.dart';
import 'package:locale_loom_app/viewmodels/splashscreen_viewmodel.dart';
import 'package:locale_loom_app/views/screens/home_page.dart';
import 'package:locale_loom_app/utils/routes/route.dart';
import 'package:locale_loom_app/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=> ResultViewModel()),
      ChangeNotifierProvider(create: (_)=> SplashScreenViewModel())
    ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    ));
  }
}
