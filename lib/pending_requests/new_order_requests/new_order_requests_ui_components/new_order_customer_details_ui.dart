import 'package:flutter/material.dart';

class NewOrderCustomerDetailsUi extends StatelessWidget {
  final Map<String, dynamic> order;
  final VoidCallback onCall;

  const NewOrderCustomerDetailsUi({super.key, required this.order, required this.onCall});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _infoRow('مکمل نام مع قوم:', '${order['customerName']} (${order['caste']})'),
        _infoRow('رہائشی پتہ:', order['customerAddress']),
        const SizedBox(height: 6),
        InkWell(
          onTap: onCall,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFECFDF5),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFA7F3D0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.phone_forwarded_rounded, size: 14, color: Color(0xFF059669)),
                const SizedBox(width: 6),
                Flexible(
                  child: Text(
                    'کسٹمر کو کال ملائیں (${order['customerPhone']})',
                    style: const TextStyle(fontSize: 11.5, color: Color(0xFF059669), fontWeight: FontWeight.bold),
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

  Widget _infoRow(String label, String val) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
            ),
          ),
        ],
      ),
    );
  }
}