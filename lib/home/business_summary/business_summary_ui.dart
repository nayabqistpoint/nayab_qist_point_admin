import 'package:flutter/material.dart';
import 'package:nayab_qist_point_admin/home/business_summary/receivable_payable_summary_ui.dart';

class BusinessSummaryUi extends StatelessWidget {
  const BusinessSummaryUi({super.key});

  @override
  Widget build(BuildContext context) {
    final metrics = [
      {'title': 'کل سرمایہ', 'amount': 'Rs. 25,00,000', 'icon': Icons.pie_chart_outline_rounded, 'color': Colors.purple},
      {'title': 'سٹاک', 'amount': 'Rs. 8,40,000', 'icon': Icons.phone_android_rounded, 'color': Colors.teal},
      {'title': 'منافع', 'amount': 'Rs. 1,45,000', 'icon': Icons.trending_up_rounded, 'color': Colors.green},
      {'title': 'اخراجات', 'amount': 'Rs. 32,000', 'icon': Icons.receipt_long_rounded, 'color': Colors.orange.shade800},
      {'title': 'آج کی وصولی', 'amount': 'Rs. 15,000', 'icon': Icons.today_rounded, 'color': Colors.blue.shade700},
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Column(
          children: [
            // 🎯 ہیڈنگ پٹی
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                children: [
                  Container(width: 4, height: 16, color: const Color(0xFF2563EB)),
                  const SizedBox(width: 6),
                  const Expanded(
                    child: Text(
                      'بزنس سمری',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Row(
                      children: [
                        Text('تفصیلی رپورٹ', style: TextStyle(fontSize: 11, color: Color(0xFF2563EB), fontWeight: FontWeight.w600)),
                        SizedBox(width: 3),
                        Icon(Icons.arrow_back_ios_new_rounded, size: 10, color: Color(0xFF2563EB)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // 🎯 ٹاپ 5 سلائیڈ ایبل کارڈز (بڑے اور خوبصورت آئیکنز کے ساتھ)
            SizedBox(
              height: 82,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: metrics.length,
                itemBuilder: (context, index) {
                  final item = metrics[index];
                  return SizedBox(
                    width: 145,
                    child: _buildCard(
                      title: item['title'] as String,
                      amount: item['amount'] as String,
                      icon: item['icon'] as IconData,
                      color: item['color'] as Color,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),

            // 🎯 باٹم 2 کارڈز (قابلِ وصول / قابلِ ادائیگی)
            const ReceivablePayableSummaryUi(),
          ],
        ),
      ),
    );
  }

  // 🎯 بڑا اور نمایاں آئیکن والا کارڈ ہیلپر
  Widget _buildCard({
    required String title,
    required String amount,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              // 🎯 آئیکن کا سائز 20 کر دیا ہے اور ہلکا سا خوبصورت پس منظر دیا ہے
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(icon, size: 20, color: color), // 👈 بڑا اور واضح آئیکن (20px)
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 11, 
                    color: Colors.black87, 
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              amount,
              style: TextStyle(
                fontSize: 13.5, 
                fontWeight: FontWeight.bold, 
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}