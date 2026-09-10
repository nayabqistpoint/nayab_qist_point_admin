import 'package:flutter/material.dart';

class QuickNavUi extends StatelessWidget {
  const QuickNavUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.phone_android_rounded, 'موبائل سٹاک', Colors.teal),
          _navItem(Icons.account_balance_rounded, 'بینک کھاتے', Colors.indigo),
          _navItem(Icons.receipt_rounded, 'اخراجات', Colors.deepOrange),
          _navItem(Icons.bar_chart_rounded, 'منافع و نقصان', Colors.green.shade800),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String title, Color color) {
    return InkWell(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(height: 6),
          Text(title, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black87)),
        ],
      ),
    );
  }
}