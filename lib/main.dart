import 'package:flutter/material.dart';
import 'package:nayab_qist_point_admin/admin_login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'نایاب قسط پوائنٹ',
      home: AdminLoginView(), // ڈائریکٹ لاگ ان پیج اوپن ہوگا
    );
  }
}