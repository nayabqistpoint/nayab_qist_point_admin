import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_first_app/customer/customer_login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();
  } catch (e) {
    debugPrint('Firebase initialization skipped or failed: $e');
  }

  // ہائیو ڈیٹا بیس کو انیشلائز کرنا
  await Hive.initFlutter();

  // 🎯 تمام ہائیو باکسز اوپن کرنا تاکہ سنکنگ میں مسئلہ نہ ائے
  await Hive.openBox('customerBox');
  await Hive.openBox('guarantorBox');
  await Hive.openBox('packageBox');
  await Hive.openBox('stockBox');
  await Hive.openBox('transactionBox');
  await Hive.openBox('expenseBox');
  await Hive.openBox('bankBox');
  await Hive.openBox('financialSummaryBox');
  await Hive.openBox('summaryBox');

  runApp(const CustomerApp());
}

class CustomerApp extends StatelessWidget {
  const CustomerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'نایاب قسط پوائنٹ - کسٹمر',
      theme: ThemeData(
        primaryColor: Colors.red[800],
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red[800]!,
          primary: Colors.red[800],
        ),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const CustomerLoginPage(),
    );
  }
}