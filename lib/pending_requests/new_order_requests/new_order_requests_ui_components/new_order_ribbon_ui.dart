import 'package:flutter/material.dart';

class NewOrderRibbonUi extends StatelessWidget {
  final String productName;
  final String date;

  const NewOrderRibbonUi({super.key, required this.productName, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1E293B), Color(0xFF334155)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(3.5),
            decoration: BoxDecoration(
              color: const Color(0xFFFDE68A).withValues(alpha: 0.18),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.devices_other_rounded, color: Color(0xFFFDE68A), size: 13),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              productName,
              style: const TextStyle(fontSize: 12, color: Color(0xFFFDE68A), fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 6),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.calendar_month_outlined, color: Color(0xFFFDE68A), size: 12),
              const SizedBox(width: 3),
              Text(
                date,
                style: const TextStyle(fontSize: 10, color: Color(0xFFF1F5F9), fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}