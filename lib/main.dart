import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app/routes/app_pages.dart';
import 'config/constant/constant.dart';
import 'config/provider/theme_provider.dart';

int? appflow = 0;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = stripePublishableKey;
  await Stripe.instance.applySettings();
  await Firebase.initializeApp();
  await GetStorage.init();
  appflow = getStorage.read("appFlow") ?? 0;
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
      initialRoute: Routes.splashScreen,
      getPages: AppPages.routes,
      // initialBinding: BindingsBuilder(() {
      //   networkController.checkInitialConnectivity();
      // }),
    );
  }
}
