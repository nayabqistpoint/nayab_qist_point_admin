import 'package:flutter/material.dart';

class NewOrderLegalDocsUi extends StatelessWidget {
  final Map<String, dynamic> order;
  final VoidCallback onToggleStamp;

  const NewOrderLegalDocsUi({super.key, required this.order, required this.onToggleStamp});

  @override
  Widget build(BuildContext context) {
    final bool inStock = order['isPurchasedByStock'];

    if (!inStock) {
      return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: const Color(0xFFFEF2F2), borderRadius: BorderRadius.circular(8)),
        child: const Row(
          children: [
            Icon(Icons.lock_clock_rounded, color: Color(0xFFDC2626), size: 16),
            SizedBox(width: 6),
            Expanded(
              child: Text(
                'موبائل اسٹاک میں پرچیز کریں تاکہ دستاویزات پرنٹ کی جا سکیں۔',
                style: TextStyle(fontSize: 10.5, color: Color(0xFF991B1B), fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );
    }

    final bool stampUploaded = order['stampUploaded'] ?? false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFCBD5E1)),
          ),
          child: Row(
            children: [
              Icon(stampUploaded ? Icons.verified_rounded : Icons.upload_file_rounded, color: stampUploaded ? const Color(0xFF059669) : const Color(0xFF2563EB), size: 20),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  stampUploaded ? 'ای-اسٹامپ منسلک ہے' : 'ای-اسٹامپ اپلوڈ کریں',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: stampUploaded ? const Color(0xFF065F46) : const Color(0xFF1E293B)),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 4),
              ElevatedButton(
                onPressed: onToggleStamp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: stampUploaded ? const Color(0xFFDC2626) : const Color(0xFF1E293B),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  visualDensity: VisualDensity.compact,
                ),
                child: Text(stampUploaded ? 'تبدیل' : 'اپلوڈ', style: const TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        const Text('دستاویزات پرنٹ کریں:', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
        const SizedBox(height: 6),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: [
            _docPill(context, '1. انوائس', Icons.receipt_rounded, const Color(0xFF0284C7)),
            _docPill(context, '2. معاہدہ اقساط', Icons.description_rounded, const Color(0xFF2563EB)),
            _docPill(context, '3. ضمانت نامہ', Icons.assignment_turned_in_rounded, const Color(0xFF7C3AED)),
            _docPill(context, '4. بیان حلفی', Icons.gavel_rounded, const Color(0xFF059669)),
          ],
        ),
      ],
    );
  }

  Widget _docPill(BuildContext context, String title, IconData icon, Color color) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$title تیار ہو رہا ہے...'), duration: const Duration(seconds: 1)),
        );
      },
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: color.withValues(alpha: 0.35)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 13, color: color),
            const SizedBox(width: 4),
            Text(title, style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold, color: color)),
          ],
        ),
      ),
    );
  }
}