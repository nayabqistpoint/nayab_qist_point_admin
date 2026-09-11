import 'package:flutter/material.dart';

class QuickNavUi extends StatelessWidget {
  const QuickNavUi({super.key});

  @override
  Widget build(BuildContext context) {
    final navItems = [
      {'title': 'موبائل سٹاک', 'icon': Icons.phone_android_rounded, 'color': Colors.teal},
      {'title': 'بینک کھاتے', 'icon': Icons.account_balance_rounded, 'color': Colors.indigo},
      {'title': 'اخراجات', 'icon': Icons.receipt_long_rounded, 'color': Colors.orange.shade800},
      {'title': 'منافع نقصان', 'icon': Icons.analytics_rounded, 'color': Colors.green},
      {'title': 'گاہک لسٹ', 'icon': Icons.people_alt_rounded, 'color': Colors.blue},
      {'title': 'سپلائر لسٹ', 'icon': Icons.local_shipping_rounded, 'color': Colors.purple},
      {'title': 'اقساط شیڈول', 'icon': Icons.calendar_month_rounded, 'color': Colors.redAccent},
    ];

    return Directionality(
      textDirection: TextDirection.rtl, // 🎯 دائیں سے بائیں (RTL)
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🎯 ہیڈنگ پٹی
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Row(
                children: [
                  Container(width: 4, height: 16, color: const Color(0xFF2563EB)),
                  const SizedBox(width: 6),
                  const Text(
                    'کوئک نیویگیشن',
                    style: TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // 🎯 بڑے اور واضح آئیکونز کے ساتھ سلائیڈ ایبل لسٹ
            SizedBox(
              height: 90, // 🎯 آئیکون اور باؤکس بڑا کرنے کے لیے ہائٹ مناسب کر دی ہے
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: navItems.length,
                itemBuilder: (context, index) {
                  final item = navItems[index];
                  return _buildNavCard(
                    title: item['title'] as String,
                    icon: item['icon'] as IconData,
                    color: item['color'] as Color,
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavCard({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: 105, // 🎯 باؤکس کی چوڑائی بڑھا دی گئی ہے
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🎯 بڑے سائز کا آئیکون اور خوبصورت بیک گراؤنڈ
            Container(
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 24, color: color), // 🎯 آئیکون سائز 24 کر دیا ہے (پہلے 18 تھا)
            ),
            const SizedBox(height: 6),
            Text(
              title,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}