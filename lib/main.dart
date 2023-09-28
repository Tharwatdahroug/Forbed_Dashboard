import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:forbeddashboard/constants.dart';
import 'package:forbeddashboard/controllers/controllers.dart';
import 'package:forbeddashboard/firebase_options.dart';
import 'package:forbeddashboard/porivider/Advertisment.dart';
import 'package:forbeddashboard/porivider/Categroys.dart';
import 'package:forbeddashboard/porivider/Feature.dart';
import 'package:forbeddashboard/porivider/Products.dart';
import 'package:forbeddashboard/screens/categroy/categroyScreen.dart';
import 'package:forbeddashboard/screens/main/main_screen.dart';
import 'package:forbeddashboard/screens/product/product.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'screens/Advertisment/AdvertismentScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MenuControllers(),
        ),
        ChangeNotifierProvider(
          create: (context) => AdvertismentProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return CategroyProvider();
          },
        ),
        // ChangeNotifierProvider(
        //   create: (context) => FeatureProvider(),
        // ),
        ChangeNotifierProvider(
          create: (context) => ProductsProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Admin Panel',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white),
          canvasColor: secondaryColor,
          useMaterial3: true,
        ),
        home: ProductScreen(),

        // CategroyScreen()

        /// ProductScreen()
        //  AdvertismentScreen(),
        // CategroyScreen(),
        // child: MainScreen(),
        // CategroyScreen(),
      ),
    );
  }
}
