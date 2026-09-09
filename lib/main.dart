import 'package:flutter/material.dart';
import 'package:nayab_qist_point_admin/admin_home_page.dart';
import 'package:nayab_qist_point_admin/theme/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'نایاب قسط پوائنٹ',
      
      // 🎯 آپ کا پسندیدہ سلیٹ کنٹراسٹ تھیم:
      theme: AppThemes.slateDarkTheme, 
      
      home: const AdminHomePage(),
    );
  }
}