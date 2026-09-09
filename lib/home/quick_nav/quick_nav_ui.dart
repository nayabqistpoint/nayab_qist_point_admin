import 'package:flutter/material.dart';
import 'package:nayab_qist_point_admin/home/quick_nav/quick_nav_logic.dart';

class QuickNavUI extends StatelessWidget {
  const QuickNavUI({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = QuickNavLogic();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: logic.items.map((item) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: item.color.withValues(alpha: 0.15),
              child: Icon(item.icon, color: item.color, size: 20),
            ),
            const SizedBox(height: 6),
            Text(item.title, style: const TextStyle(fontSize: 11)),
          ],
        );
      }).toList(),
    );
  }
}