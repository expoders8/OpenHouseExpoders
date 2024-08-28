import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app/routes/app_pages.dart';
import 'config/provider/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  return runApp(
    ChangeNotifierProvider<ThemeProvider>(
      child: const MyApp(),
      create: (BuildContext context) {
        const isDark = false;
        return ThemeProvider(isDark);
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: Provider.of<ThemeProvider>(context, listen: false).getTheme(),
      initialRoute: Routes.loginPage,
      getPages: AppPages.routes,
    );
  }
}
