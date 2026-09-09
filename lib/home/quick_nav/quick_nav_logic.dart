import 'package:flutter/material.dart';

class QuickNavItem {
  final String title;
  final IconData icon;
  final Color color;

  QuickNavItem(this.title, this.icon, this.color);
}

class QuickNavLogic {
  final List<QuickNavItem> items = [
    QuickNavItem('موبائل سٹاک', Icons.phone_android, Colors.teal),
    QuickNavItem('بینک کھاتے', Icons.account_balance, Colors.indigo),
    QuickNavItem('اخراجات', Icons.attach_money, Colors.orange),
    QuickNavItem('منافع و نقصان', Icons.insert_chart, Colors.green),
  ];
}