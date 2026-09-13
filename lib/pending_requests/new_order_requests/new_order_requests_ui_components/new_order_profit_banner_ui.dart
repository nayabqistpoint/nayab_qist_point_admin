import 'package:flutter/material.dart';

class NewOrderProfitBannerUi extends StatelessWidget {
  final Map<String, dynamic> order;

  const NewOrderProfitBannerUi({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFCBD5E1)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _metricBox('اصل کیش', 'Rs. ${order['cashPrice'] ?? order['customerQuotedPrice']}', const Color(0xFF475569)),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: _metricBox('ماہانہ قسط', 'Rs. ${order['monthlyInstallment']}', const Color(0xFF2563EB)),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: _metricBox('خالص منافع', 'Rs. ${order['adminProfit']}', const Color(0xFF15803D), isHighlight: true),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: BoxDecoration(color: const Color(0xFFEFF6FF), borderRadius: BorderRadius.circular(6)),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    order['advance'] > 0 ? 'ایڈوانس: Rs. ${order['advance']}' : 'زیرو ایڈوانس پلان',
                    style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF1E40AF)),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 4),
                Flexible(
                  child: Text(
                    'IMEI: ${order['imei'] ?? 'دستیاب نہیں'}',
                    style: TextStyle(
                      fontSize: 10.5,
                      fontWeight: FontWeight.bold,
                      color: order['imei'] != null ? const Color(0xFF0F172A) : const Color(0xFFDC2626),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _metricBox(String title, String val, Color color, {bool isHighlight = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      decoration: BoxDecoration(
        color: isHighlight ? const Color(0xFFECFDF5) : const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: isHighlight ? const Color(0xFFA7F3D0) : const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 10, color: Color(0xFF64748B), fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            val,
            style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, color: color),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}