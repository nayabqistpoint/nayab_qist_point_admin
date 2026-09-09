import 'package:flutter/material.dart';
import 'package:nayab_qist_point_admin/home/net_balance/net_balance_logic.dart';

class NetBalanceUI extends StatelessWidget {
  const NetBalanceUI({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = NetBalanceLogic();
    final primaryColor = Theme.of(context).primaryColor;

    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'موجودہ خالص کیش (Net Balance)',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              Container(
                // 👈 یہاںInsets.symmetric درست کر دیا گیا ہے
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'لسٹ (${logic.pendingCount})',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            logic.netBalance,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(color: Colors.white24, height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'پینڈنگ قسط کی درخواستیں (${logic.pendingCount})',
                style: const TextStyle(color: Colors.white70, fontSize: 13),
              ),
              Text(
                logic.pendingInstallments,
                style: const TextStyle(
                  color: Color(0xFF38BDF8),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}