import 'package:flutter/material.dart';

class PaymentRequestScheduleTableUi extends StatelessWidget {
  final List<dynamic> scheduleList;
  final bool isOpen;
  final VoidCallback onToggle;

  const PaymentRequestScheduleTableUi({
    super.key,
    required this.scheduleList,
    required this.isOpen,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onToggle,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFF94A3B8), width: 1.1),
            ),
            child: Row(
              children: [
                const Icon(Icons.table_chart_outlined, size: 17, color: Color(0xFF1E293B)),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'اقساط کا مکمل شیڈول و ہسٹری پلان دیکھیں',
                    style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                  ),
                ),
                Icon(
                  isOpen ? Icons.remove_circle_outline_rounded : Icons.add_circle_outline_rounded,
                  size: 17,
                  color: const Color(0xFF475569),
                ),
              ],
            ),
          ),
        ),
        if (isOpen) ...[
          const SizedBox(height: 9),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFCBD5E1)),
            ),
            child: Table(
              border: TableBorder.symmetric(inside: const BorderSide(color: Color(0xFFE2E8F0), width: 1)),
              columnWidths: const {
                0: FlexColumnWidth(0.8),
                1: FlexColumnWidth(1.4),
                2: FlexColumnWidth(1.2),
                3: FlexColumnWidth(1.3),
              },
              children: [
                const TableRow(
                  decoration: BoxDecoration(color: Color(0xFFF1F5F9)),
                  children: [
                    Padding(padding: EdgeInsets.all(7), child: Text('قسط #', textAlign: TextAlign.center, style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, color: Color(0xFF475569)))),
                    Padding(padding: EdgeInsets.all(7), child: Text('مہینہ', textAlign: TextAlign.center, style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, color: Color(0xFF475569)))),
                    Padding(padding: EdgeInsets.all(7), child: Text('رقم', textAlign: TextAlign.center, style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, color: Color(0xFF475569)))),
                    Padding(padding: EdgeInsets.all(7), child: Text('کیفیت', textAlign: TextAlign.center, style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, color: Color(0xFF475569)))),
                  ],
                ),
                ...scheduleList.map((entry) {
                  final String status = entry['status'];
                  Widget statusWidget;

                  if (status == 'PAID') {
                    statusWidget = const Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.check_circle_rounded, size: 14, color: Color(0xFF16A34A)), SizedBox(width: 3), Text('ادا شدہ', style: TextStyle(fontSize: 11, color: Color(0xFF16A34A), fontWeight: FontWeight.bold))]);
                  } else if (status == 'DEFAULT') {
                    statusWidget = const Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.cancel_rounded, size: 14, color: Color(0xFFDC2626)), SizedBox(width: 3), Text('شارٹ', style: TextStyle(fontSize: 11, color: Color(0xFFDC2626), fontWeight: FontWeight.bold))]);
                  } else if (status == 'CURRENT') {
                    statusWidget = const Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.pending_actions_rounded, size: 14, color: Color(0xFF2563EB)), SizedBox(width: 3), Text('موصولہ', style: TextStyle(fontSize: 11, color: Color(0xFF2563EB), fontWeight: FontWeight.bold))]);
                  } else {
                    statusWidget = const Text('بقایا', textAlign: TextAlign.center, style: TextStyle(fontSize: 11, color: Color(0xFF94A3B8)));
                  }

                  return TableRow(
                    decoration: BoxDecoration(
                      color: status == 'CURRENT' ? const Color(0xFFEFF6FF) : Colors.transparent,
                    ),
                    children: [
                      Padding(padding: const EdgeInsets.symmetric(vertical: 7), child: Text('${entry['no']}', textAlign: TextAlign.center, style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold))),
                      Padding(padding: const EdgeInsets.symmetric(vertical: 7), child: Text(entry['month'], textAlign: TextAlign.center, style: const TextStyle(fontSize: 11.5))),
                      Padding(padding: const EdgeInsets.symmetric(vertical: 7), child: Text(entry['amount'], textAlign: TextAlign.center, style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold))),
                      Padding(padding: const EdgeInsets.symmetric(vertical: 7), child: statusWidget),
                    ],
                  );
                }),
              ],
            ),
          ),
        ],
      ],
    );
  }
}