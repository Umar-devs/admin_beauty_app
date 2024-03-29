import 'package:admin_beauty_app/View/Pages/Login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

import 'View/Pages/My Bottom Nav Bar/my_bottom_nav.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCl_qL6AAG52JaceN0Ff2WTHcG-7DL8SEc",
      appId: "1:375864446012:android:5edc4bb248ba5e56228739",
      messagingSenderId: '375864446012',
      projectId: 'beauty-app-d3084',
    ),
  );  Stripe.publishableKey =
  'pk_live_51MXhWFGtmelo2vv11GFCT3qPaFg2NrXUHOBJauLwiHKkEVttYIwu61Zia4vgXU1tFSR3eyNLvEvgYijjs1WL06gg00MP0DgaP9';
  await dotenv.load(fileName: 'assets/.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final auth=FirebaseAuth.instance.currentUser;
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:auth==null?LoginScreen():const MyBottomNavBar(),
    );
  }
}
      