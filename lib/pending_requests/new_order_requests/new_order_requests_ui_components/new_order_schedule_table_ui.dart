import 'package:flutter/material.dart';

class NewOrderScheduleTableUi extends StatelessWidget {
  final Map<String, dynamic> order;

  const NewOrderScheduleTableUi({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final List list = order['schedule'];
    final int advance = order['advance'] ?? 0;
    final int total = order['totalInstallmentPrice'] ?? 0;
    final int remainingBalance = total - advance;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: const Color(0xFFCBD5E1)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text('کل: Rs. $total', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)), overflow: TextOverflow.ellipsis),
              ),
              Expanded(
                child: Text('ایڈوانس: Rs. $advance', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF2563EB)), textAlign: TextAlign.center, overflow: TextOverflow.ellipsis),
              ),
              Expanded(
                child: Text('بقایا: Rs. $remainingBalance', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF15803D)), textAlign: TextAlign.end, overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Table(
          border: TableBorder.symmetric(inside: const BorderSide(color: Color(0xFFE2E8F0), width: 1)),
          columnWidths: const {
            0: FlexColumnWidth(0.6),
            1: FlexColumnWidth(1.3),
            2: FlexColumnWidth(1.2),
            3: FlexColumnWidth(1.0),
          },
          children: [
            const TableRow(
              decoration: BoxDecoration(color: Color(0xFFF8FAFC)),
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2), child: Text('#', textAlign: TextAlign.center, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold))),
                Padding(padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2), child: Text('تاریخ', textAlign: TextAlign.center, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold))),
                Padding(padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2), child: Text('رقم', textAlign: TextAlign.center, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold))),
                Padding(padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2), child: Text('اسٹیٹس', textAlign: TextAlign.center, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold))),
              ],
            ),
            ...list.map((item) {
              final bool isHalf = item['type'].toString().contains('ہاف');
              return TableRow(
                decoration: BoxDecoration(color: isHalf ? const Color(0xFFFFFBEB) : Colors.transparent),
                children: [
                  Padding(padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 2), child: Text('${item['no']}', textAlign: TextAlign.center, style: const TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold))),
                  Padding(padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 2), child: Text(item['date'], textAlign: TextAlign.center, style: const TextStyle(fontSize: 10))),
                  Padding(padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 2), child: Text(item['amount'], textAlign: TextAlign.center, style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold, color: isHalf ? const Color(0xFFB45309) : const Color(0xFF0F172A)))),
                  Padding(padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 2), child: Text(item['status'], textAlign: TextAlign.center, style: const TextStyle(fontSize: 10, color: Color(0xFF64748B)))),
                ],
              );
            }),
          ],
        ),
      ],
    );
  }
}