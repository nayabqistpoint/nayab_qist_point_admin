import 'package:flutter/material.dart';

class PaymentRequestTransactionInfoUi extends StatelessWidget {
  final Map<String, dynamic> item;

  const PaymentRequestTransactionInfoUi({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
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
                child: _infoBlock('مہینہ', item['month'], Icons.event_note_rounded, const Color(0xFF2563EB)),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: _infoBlock('طریقہ ادائیگی', '${item['paymentMethod']}', Icons.account_balance_wallet_rounded, const Color(0xFF7C3AED)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
            decoration: BoxDecoration(
              color: item['isShort'] ? const Color(0xFFFEF2F2) : const Color(0xFFECFDF5),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: item['isShort'] ? const Color(0xFFFCA5A5) : const Color(0xFFA7F3D0)),
            ),
            child: Row(
              children: [
                Icon(
                  item['isShort'] ? Icons.warning_amber_rounded : Icons.check_circle_outline_rounded,
                  size: 16,
                  color: item['isShort'] ? const Color(0xFFDC2626) : const Color(0xFF059669),
                ),
                const SizedBox(width: 5),
                const Text(
                  'اسٹیٹس:',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF475569)),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    item['shortAmount'],
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: item['isShort'] ? const Color(0xFFDC2626) : const Color(0xFF059669),
                    ),
                    textAlign: TextAlign.end,
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

  Widget _infoBlock(String title, String val, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 15, color: color),
          const SizedBox(width: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 9.5, color: Color(0xFF64748B), fontWeight: FontWeight.bold)),
                Text(val, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)), overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ],
      ),
    );
  }
}