import 'package:flutter/material.dart';

class SignupRequestPersonalInfoUi extends StatelessWidget {
  final Map<String, String> item;
  final VoidCallback onCallTap;

  const SignupRequestPersonalInfoUi({
    super.key,
    required this.item,
    required this.onCallTap,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow(Icons.groups_2_rounded, const Color(0xFFD97706), const Color(0xFFFEF3C7), 'قوم:', item['caste']!),
        _buildInfoRow(Icons.family_restroom_rounded, const Color(0xFF4F46E5), const Color(0xFFEEF2FF), 'ولدیت:', item['fatherName']!),
        _buildInfoRow(Icons.credit_card_rounded, const Color(0xFF0284C7), const Color(0xFFE0F2FE), 'شناختی کارڈ:', item['cnic']!),
        _buildInfoRow(Icons.location_on_rounded, const Color(0xFFEA580C), const Color(0xFFFFF7ED), 'پتہ:', item['address']!),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFCBD5E1)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.phone_android_rounded, size: 16, color: Color(0xFF059669)),
                  const SizedBox(width: 6),
                  const Text('موبائل نمبر: ', style: TextStyle(fontSize: 12, color: Color(0xFF475569), fontWeight: FontWeight.bold)),
                  Expanded(
                    child: Text(
                      item['phone']!,
                      style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.bold, color: Color(0xFF0F172A), letterSpacing: 0.5),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: onCallTap,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFECFDF5),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFA7F3D0)),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone_forwarded_rounded, size: 14, color: Color(0xFF059669)),
                      SizedBox(width: 6),
                      Text(
                        'اس نمبر پر کال ملائیں',
                        style: TextStyle(fontSize: 11.5, color: Color(0xFF059669), fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}