import 'package:flutter/material.dart';
import 'package:nayab_qist_point_admin/home/business_summary/business_summary_logic.dart';

class BusinessSummaryUI extends StatelessWidget {
  const BusinessSummaryUI({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = BusinessSummaryLogic();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'مالیاتی خلاصہ (Business Summary)',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('تفصیل رپورٹ >'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _buildItem('کل سرمایہ کاری', logic.totalInvestment, Colors.purple),
                ),
                Expanded(
                  child: _buildItem('موبائل سٹاک مالیات', logic.mobileStockValuation, Colors.teal),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildBox(
                    'کل وصولی (لینا ہے) ↓',
                    logic.totalReceivable,
                    Colors.green.shade700,
                    Colors.green.shade50,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildBox(
                    'کل زائد / دینا ↑ (Red)',
                    logic.totalPayable,
                    Colors.red.shade700,
                    Colors.red.shade50,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(String label, String value, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 4),
        Text(value, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 14)),
      ],
    );
  }

  Widget _buildBox(String label, String value, Color textColor, Color bgColor) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: textColor, fontSize: 12)),
          const SizedBox(height: 6),
          Text(value, style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 15)),
        ],
      ),
    );
  }
}