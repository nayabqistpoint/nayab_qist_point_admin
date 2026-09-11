import 'package:flutter/material.dart';

class NetBalanceUi extends StatelessWidget {
  const NetBalanceUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        // 🎯 دائیں (Right) جانب واضع روشنی اور چمک، بائیں (Left) جانب ڈارک شیڈ
        gradient: const LinearGradient(
          begin: Alignment.topRight,     // لائٹ ریفلیکشن کی شروعات (بینکس لسٹ والی سائیڈ)
          end: Alignment.bottomLeft,    // گہرائی اور ڈارکنس (بائیں طرف)
          stops: [0.0, 0.5, 1.0],
          colors: [
            Color(0xFF4A5E7D),          // رائٹ سائیڈ: کافی روشن اور لائٹ سلیٹ ہائی لائٹ
            Color(0xFF233247),          // درمیان: میڈیم سلیٹ
            Color(0xFF0D131C),          // لیفٹ سائیڈ: ڈارک نائٹ شیڈ
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.18),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                child: Text(
                  'موجودہ خالص کیش (Net Balance)',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 10),
                      SizedBox(width: 4),
                      Text(
                        'بینکس لسٹ (5)',
                        style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Rs. 4,85,200',
            style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Divider(color: Colors.white.withValues(alpha: 0.12), height: 1),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  children: [
                    Icon(Icons.assignment_outlined, color: Colors.amber.shade300, size: 18),
                    const SizedBox(width: 6),
                    const Flexible(
                      child: Text(
                        'پینڈنگ قسط کی درخواستیں (5):',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Rs. 28,500',
                style: TextStyle(color: Colors.amber.shade300, fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}