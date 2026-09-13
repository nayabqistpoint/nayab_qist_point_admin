import 'package:flutter/material.dart';

class PaymentRequestReceiptTileUi extends StatelessWidget {
  final bool isOpen;
  final VoidCallback onToggle;

  const PaymentRequestReceiptTileUi({
    super.key,
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
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFCBD5E1)),
            ),
            child: Row(
              children: [
                const Icon(Icons.receipt_long_outlined, size: 17, color: Color(0xFF2563EB)),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text('بینک / ایزی پیسہ رسید کی تصویر', style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
                ),
                Icon(isOpen ? Icons.remove_circle_outline_rounded : Icons.add_circle_outline_rounded, size: 17, color: const Color(0xFF64748B)),
              ],
            ),
          ),
        ),
        if (isOpen) ...[
          const SizedBox(height: 8),
          Container(
            height: 110,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFCBD5E1)),
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.image_outlined, size: 30, color: Color(0xFF2563EB)),
                  SizedBox(height: 5),
                  Text('رسید کی سلپ لوڈ ہو رہی ہے...', style: TextStyle(fontSize: 11.5, color: Color(0xFF64748B))),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}