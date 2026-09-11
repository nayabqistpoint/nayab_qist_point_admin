import 'package:flutter/material.dart';

class CustomerListUi extends StatelessWidget {
  const CustomerListUi({super.key});

  @override
  Widget build(BuildContext context) {
    final customers = _getDummyData();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: const EdgeInsets.only(left: 14, right: 14, top: 4, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE2E8F0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 4),
          itemCount: customers.length,
          itemBuilder: (context, index) => _buildRow(customers[index]),
        ),
      ),
    );
  }

  // 🎯 ग्राहक की सिंगल रो (Row)
  Widget _buildRow(Map<String, dynamic> c) {
    final isOverdue = c['statusType'] == 'overdue';
    final isClear = c['statusType'] == 'clear';

    final color = isOverdue ? const Color(0xFFDC2626) : (isClear ? const Color(0xFF16A34A) : const Color(0xFF1E293B));
    final statusBg = isOverdue ? const Color(0xFFFEF2F2) : (isClear ? const Color(0xFFF0FDF4) : const Color(0xFFF1F5F9));
    final statusTextClr = isOverdue ? const Color(0xFFDC2626) : (isClear ? const Color(0xFF16A34A) : const Color(0xFF475569));
    final icon = isOverdue ? Icons.warning_amber_rounded : (isClear ? Icons.check_circle_rounded : Icons.access_time_rounded);

    return InkWell(
      onTap: () {},
      splashColor: const Color(0xFFF1F5F9),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // दाईं तरफ: अवतार + नाम + तारीख
            Row(
              children: [
                CircleAvatar(
                  radius: 19,
                  backgroundColor: isOverdue ? const Color(0xFFFEF2F2) : const Color(0xFFEFF6FF),
                  child: Text(
                    c['initial'],
                    style: TextStyle(
                      color: isOverdue ? const Color(0xFFDC2626) : const Color(0xFF2563EB),
                      fontWeight: FontWeight.bold,
                      fontSize: 13.5,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(c['name'], style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                    const SizedBox(height: 3),
                    Row(
                      children: [c['day'], c['month'], c['year']]
                          .map((txt) => Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Text(txt, style: const TextStyle(fontSize: 10, color: Color(0xFF64748B), fontWeight: FontWeight.w500)),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ],
            ),
            // बाईं तरफ: रकम + स्टेटस
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(c['amount'], style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: color)),
                const SizedBox(height: 3),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(color: statusBg, borderRadius: BorderRadius.circular(6)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(icon, size: 10.5, color: statusTextClr),
                      const SizedBox(width: 3),
                      Text(c['statusText'], style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: statusTextClr)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 🎯 डमी डेटा
  List<Map<String, dynamic>> _getDummyData() {
    final names = ['محمد افضل', 'علی رضا', 'عثمان خان', 'بلال احمد', 'طارق محمود'];
    final months = ['جنوری', 'فروری', 'مارچ', 'اپریل', 'مئی', 'جون', 'جولائی', 'اگست', 'ستمبر'];
    final statusTypes = ['overdue', 'clear', 'normal'];

    return List.generate(20, (i) {
      final type = statusTypes[i % 3];
      return {
        'name': names[i % 5],
        'day': '${(i + 1) % 28 + 1}'.padLeft(2, '0'),
        'month': months[i % months.length],
        'year': '2026',
        'amount': type == 'clear' ? 'Rs. 0' : 'Rs. ${(i + 1) * 8500}',
        'statusType': type,
        'statusText': type == 'overdue' ? '${(i + 1) * 3} دن' : (type == 'clear' ? 'کلیئر' : 'ڈیو'),
        'initial': names[i % 5][0],
      };
    });
  }
}