import 'package:flutter/material.dart';

class NewOrderActionButtonsUi extends StatelessWidget {
  final bool inStock;
  final Map<String, dynamic> order;
  final VoidCallback onApprove;
  final VoidCallback onReject;

  const NewOrderActionButtonsUi({
    super.key,
    required this.inStock,
    required this.order,
    required this.onApprove,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    final bool canApprove = inStock && (order['cnicCopied'] == true) && (order['docsSigned'] == true);

    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: canApprove ? onApprove : null,
            icon: const Icon(Icons.check_rounded, size: 18),
            label: Text(
              !inStock
                  ? 'پہلے موبائل خریدیں'
                  : !canApprove
                      ? 'لازمی دستاویزات کی تصدیق درکار ہے'
                      : 'تصدیق و کھاتہ چالو کریں',
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1E293B),
              foregroundColor: Colors.white,
              disabledBackgroundColor: const Color(0xFF94A3B8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              minimumSize: const Size.fromHeight(40),
            ),
          ),
        ),
        const SizedBox(width: 8),
        OutlinedButton(
          onPressed: onReject,
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            side: const BorderSide(color: Color(0xFF94A3B8)),
            minimumSize: const Size(80, 40),
          ),
          child: const Text('مسترد', style: TextStyle(fontSize: 13, color: Color(0xFF334155), fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}