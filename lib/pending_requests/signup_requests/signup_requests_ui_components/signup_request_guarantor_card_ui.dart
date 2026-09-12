import 'package:flutter/material.dart';

class SignupRequestGuarantorCardUi extends StatelessWidget {
  final Map<String, String> item;
  final bool guarantorOpen;
  final VoidCallback onToggle;

  const SignupRequestGuarantorCardUi({
    super.key,
    required this.item,
    required this.guarantorOpen,
    required this.onToggle,
  });

  Widget _buildInfoRow(IconData icon, Color iconColor, Color bgColor, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(icon, size: 14, color: iconColor),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 80,
            child: Padding(
              padding: const EdgeInsets.only(top: 1),
              child: Text(
                label,
                style: const TextStyle(fontSize: 11.5, color: Color(0xFF475569), fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 1),
              child: Text(
                value,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                softWrap: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onToggle,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFCBD5E1)),
            ),
            child: Row(
              children: [
                const Icon(Icons.verified_user_rounded, size: 16, color: Color(0xFF7C3AED)),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'ضامن: ${item['guarantorName']} (${item['guarantorRelation']})',
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(
                  guarantorOpen ? Icons.remove_circle_outline_rounded : Icons.add_circle_outline_rounded,
                  size: 16,
                  color: const Color(0xFF64748B),
                ),
              ],
            ),
          ),
        ),
        if (guarantorOpen) ...[
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Column(
              children: [
                _buildInfoRow(Icons.person_rounded, const Color(0xFF7C3AED), const Color(0xFFF5F3FF), 'نام ضامن:', item['guarantorName']!),
                _buildInfoRow(Icons.link_rounded, const Color(0xFF2563EB), const Color(0xFFEEF2FF), 'کسٹمر سے رشتہ:', item['guarantorRelation']!),
                _buildInfoRow(Icons.groups_rounded, const Color(0xFFD97706), const Color(0xFFFEF3C7), 'قوم ضامن:', item['guarantorCaste']!),
                _buildInfoRow(Icons.call_rounded, const Color(0xFF059669), const Color(0xFFECFDF5), 'فون نمبر:', item['guarantorPhone']!),
                _buildInfoRow(Icons.credit_card_rounded, const Color(0xFF0284C7), const Color(0xFFE0F2FE), 'شناختی کارڈ:', item['guarantorCnic']!),
              ],
            ),
          ),
        ],
      ],
    );
  }
}