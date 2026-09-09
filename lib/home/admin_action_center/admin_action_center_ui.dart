import 'package:flutter/material.dart';
import 'package:nayab_qist_point_admin/home/admin_action_center/admin_action_center_logic.dart';

class AdminActionCenterUI extends StatelessWidget {
  const AdminActionCenterUI({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = AdminActionCenterLogic();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'ایکشن سینٹر (پینڈنگ درخواستیں)',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.amber.shade900.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'توجہ طلب',
                  style: TextStyle(color: Colors.amber, fontSize: 11, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: logic.requests.length,
            itemBuilder: (context, index) {
              final item = logic.requests[index];
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF0F172A),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item.title,
                        style: const TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.amber.shade600,
                      child: Text(
                        '${item.count}',
                        style: const TextStyle(color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}