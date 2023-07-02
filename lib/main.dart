import 'package:app/colors/colors.dart';
import 'package:app/crud_operations/crud_screens.dart';
import 'package:app/email_auth/login_auth.dart';
import 'package:app/screens/admin_screens/admin_screen.dart';
import 'package:app/screens/admin_screens/users_model.dart';
import 'package:app/screens/doo_screen/NotificationModel.dart';
import 'package:app/screens/doo_screen/doo_screen.dart';
import 'package:app/screens/fyp_committe_screens/fyp_committee.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/screens/users_screen/home_nav_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.transparent,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsersModel()),
        ChangeNotifierProvider(create: (_) => CRUDProvider()),
        ChangeNotifierProvider(create: (_) => NotificationModel()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: FYPScreen(),
        ),
      ),
    );
  }
}
