import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';

// ایڈمن اور کسٹمر دونوں پیجز کے امپورٹس
// ignore: unused_import
import 'package:my_first_app/admin/welcome/login_page.dart';
import 'package:my_first_app/customer/customer_login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    if (kIsWeb) {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyDuo41m3PSRaj0xk4RSuidvjpChTjoM7Qw",
          authDomain: "nayab-qist-point.firebaseapp.com",
          projectId: "nayab-qist-point",
          storageBucket: "nayab-qist-point.firebasestorage.app",
          messagingSenderId: "559470553711",
          appId: "1:559470553711:web:1434ea9e05cc073c633b9a",
          measurementId: "G-33TSZN62T6",
        ),
      );
    } else {
      await Firebase.initializeApp();
    }
  } catch (e) {
    debugPrint('Firebase initialization skipped or failed: $e');
  }

  await Hive.initFlutter();

  await Hive.openBox('customerBox');
  await Hive.openBox('guarantorBox');
  await Hive.openBox('packageBox');
  await Hive.openBox('stockBox');
  await Hive.openBox('transactionBox');
  await Hive.openBox('expenseBox');
  await Hive.openBox('bankBox');
  await Hive.openBox('financialSummaryBox');
  await Hive.openBox('summaryBox');
  await Hive.openBox('usersBox');
  await Hive.openBox('outboxBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'نایاب قسط پوائنٹ',
      theme: ThemeData(
        primaryColor: Colors.red[800],
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red[800]!,
          primary: Colors.red[800],
        ),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),

      // 🎯 کسٹمر پیج کی UI بنانے کے لیے اسے آن رکھیں:
      home: const CustomerLoginPage(),

      // 🎯 جب ایڈمن پینل ٹیسٹ کرنا ہو تو اوپر والی کو کمینٹ کر کے نیچے والی آن کر لیں:
      // home: const LoginPage(),
    );
  }
}