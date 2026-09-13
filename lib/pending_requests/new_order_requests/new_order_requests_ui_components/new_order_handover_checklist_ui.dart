import 'package:flutter/material.dart';

class NewOrderHandoverChecklistUi extends StatelessWidget {
  final Map<String, dynamic> order;
  final TextEditingController notesController;
  final Function(String, bool) onUpdateChecklist;

  const NewOrderHandoverChecklistUi({
    super.key,
    required this.order,
    required this.notesController,
    required this.onUpdateChecklist,
  });

  @override
  Widget build(BuildContext context) {
    final bool photoTaken = order['photoTaken'] ?? false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _checkItem('شناختی کارڈ نقول موصول (لازمی)', order['cnicCopied'] ?? false, (v) => onUpdateChecklist('cnicCopied', v ?? false), isRequired: true),
        _checkItem('معاہدہ اقساط پر دستخط (لازمی)', order['docsSigned'] ?? false, (v) => onUpdateChecklist('docsSigned', v ?? false), isRequired: true),
        _checkItem('مطلوبہ پیشگی ایڈوانس وصول ہو گیا', order['advanceReceived'] ?? false, (v) => onUpdateChecklist('advanceReceived', v ?? false)),
        _checkItem('فزیکل اسٹامپ پیپر و بیان حلفی جمع', order['stampPaperReceived'] ?? false, (v) => onUpdateChecklist('stampPaperReceived', v ?? false)),
        _checkItem('سیکیورٹی بینک چیک موصول ہو گیا', order['chequeReceived'] ?? false, (v) => onUpdateChecklist('chequeReceived', v ?? false)),
        const Divider(height: 8, color: Color(0xFFE2E8F0)),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          decoration: BoxDecoration(
            color: (order['boxRetainedInShop'] ?? false) ? const Color(0xFFFEF3C7) : const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            children: [
              Checkbox(
                value: order['boxRetainedInShop'] ?? false,
                onChanged: (v) => onUpdateChecklist('boxRetainedInShop', v ?? false),
                activeColor: const Color(0xFFD97706),
                visualDensity: VisualDensity.compact,
              ),
              const SizedBox(width: 4),
              const Expanded(
                child: Text(
                  'موبائل کا اصل باکس شاپ پر ضبط رکھا گیا ہے',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF92400E)),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),

        InkWell(
          onTap: () => onUpdateChecklist('photoTaken', !photoTaken),
          borderRadius: BorderRadius.circular(6),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              color: photoTaken ? const Color(0xFFECFDF5) : const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: photoTaken ? const Color(0xFFA7F3D0) : const Color(0xFFBFDBFE)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(photoTaken ? Icons.check_circle_rounded : Icons.camera_alt_rounded, size: 15, color: photoTaken ? const Color(0xFF059669) : const Color(0xFF2563EB)),
                const SizedBox(width: 5),
                Text(photoTaken ? 'تحویل سیلفی محفوظ ہے' : 'حوالگی سیلفی / فوٹو لیں', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: photoTaken ? const Color(0xFF065F46) : const Color(0xFF1E40AF))),
              ],
            ),
          ),
        ),
        const SizedBox(height: 6),

        TextFormField(
          controller: notesController,
          maxLines: 2,
          style: const TextStyle(fontSize: 11.5),
          decoration: InputDecoration(
            hintText: 'تحویل سے متعلق اضافی نوٹ درج کریں...',
            hintStyle: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8)),
            contentPadding: const EdgeInsets.all(8),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: const BorderSide(color: Color(0xFFCBD5E1))),
          ),
        ),
      ],
    );
  }

  Widget _checkItem(String title, bool val, ValueChanged<bool?> onChanged, {bool isRequired = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Row(
        children: [
          Checkbox(
            value: val,
            onChanged: onChanged,
            activeColor: const Color(0xFF1E293B),
            visualDensity: VisualDensity.compact,
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 11.5,
                fontWeight: isRequired ? FontWeight.bold : FontWeight.normal,
                color: isRequired ? const Color(0xFF0F172A) : const Color(0xFF334155),
              ),
            ),
          ),
        ],
      ),
    );
  }
}