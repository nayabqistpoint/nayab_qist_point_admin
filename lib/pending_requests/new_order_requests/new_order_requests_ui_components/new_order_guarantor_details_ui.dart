import 'package:flutter/material.dart';

class NewOrderGuarantorDetailsUi extends StatelessWidget {
  final Map<String, dynamic> order;
  final VoidCallback onCall;

  const NewOrderGuarantorDetailsUi({super.key, required this.order, required this.onCall});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _infoRow('ضامن کا نام:', order['guarantorName']),
        _infoRow('کسٹمر سے رشتہ:', order['guarantorRelation'], isHighlight: true),
        const SizedBox(height: 6),
        InkWell(
          onTap: onCall,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFBFDBFE)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.phone_forwarded_rounded, size: 14, color: Color(0xFF2563EB)),
                const SizedBox(width: 6),
                Flexible(
                  child: Text(
                    'ضامن کو کال ملائیں (${order['guarantorPhone']})',
                    style: const TextStyle(fontSize: 11.5, color: Color(0xFF2563EB), fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _infoRow(String label, String val, {bool isHighlight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 11.5, color: Color(0xFF64748B), fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              val,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isHighlight ? const Color(0xFF2563EB) : const Color(0xFF0F172A),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}