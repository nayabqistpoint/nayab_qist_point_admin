import 'package:flutter/material.dart';

class BusinessSummaryUi extends StatelessWidget {
  const BusinessSummaryUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'مالیاتی خلاصہ (Business Summary)',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              InkWell(
                onTap: () {},
                child: const Row(
                  children: [
                    Icon(Icons.arrow_back_ios_new_rounded, size: 10, color: Colors.grey),
                    SizedBox(width: 2),
                    Text('تفصیل رپورٹ', style: TextStyle(fontSize: 11, color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 75,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            children: [
              _metricCard('کل سرمایہ کاری', 'Rs. 25,00,000', Icons.pie_chart_outline_rounded, Colors.purple),
              _metricCard('موبائل سٹاک مالیات', 'Rs. 8,40,000', Icons.phone_android_rounded, Colors.teal),
              _metricCard('ماہانہ اخراجات', 'Rs. 32,000', Icons.receipt_long_rounded, Colors.orange.shade800),
              _metricCard('خالص منافع', 'Rs. 1,45,000', Icons.trending_up_rounded, Colors.green),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 90,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const PageScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            children: [
              _summarySlideCard('کل وصولی (لینا ہے)', 'Rs. 12,40,000', Icons.arrow_downward_rounded, Colors.green),
              _summarySlideCard('کل زاید / دینا (Red)', 'Rs. 45,000', Icons.arrow_upward_rounded, Colors.red),
            ],
          ),
        ),
      ],
    );
  }

  Widget _metricCard(String label, String amount, IconData icon, Color color) {
    return Container(
      width: 135,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(icon, size: 13, color: color),
              const SizedBox(width: 4),
              Expanded(
                child: Text(label, style: const TextStyle(fontSize: 9, color: Colors.grey), maxLines: 1),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(amount, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }

  Widget _summarySlideCard(String title, String amount, IconData icon, Color color) {
    return Container(
      width: 170,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(icon, size: 14, color: color),
              const SizedBox(width: 4),
              Text(title, style: TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 6),
          Text(amount, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
}