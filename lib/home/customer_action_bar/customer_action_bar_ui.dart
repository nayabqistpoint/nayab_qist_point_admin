import 'package:flutter/material.dart';

class CustomerActionBarUi extends StatelessWidget {
  const CustomerActionBarUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 42,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search_rounded, color: Colors.grey, size: 18),
                  SizedBox(width: 8),
                  Text('کسٹمر نام یا نمبر تلاش کریں...', style: TextStyle(color: Colors.grey, fontSize: 11)),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.person_add_alt_1_rounded, size: 16),
            label: const Text('نیا کسٹمر', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1E293B), // Slate primary
              foregroundColor: Colors.white,
              elevation: 0,
              minimumSize: const Size(0, 42),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
      ),
    );
  }
}