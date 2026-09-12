import 'package:flutter/material.dart';

class SignupRequestDocsTileUi extends StatelessWidget {
  final bool docsOpen;
  final VoidCallback onToggle;

  const SignupRequestDocsTileUi({
    super.key,
    required this.docsOpen,
    required this.onToggle,
  });

  // باکس کی اونچائی 65 سے بڑھا کر 90 کر دی گئی ہے
  Widget _buildDocPlaceholder(String title) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFCBD5E1)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x06000000),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.badge_outlined, size: 28, color: Color(0xFF2563EB)),
            const SizedBox(height: 6),
            Text(
              title,
              style: const TextStyle(fontSize: 11, color: Color(0xFF1E293B), fontWeight: FontWeight.bold),
            ),
          ],
        ),
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
                const Icon(Icons.file_copy_outlined, size: 16, color: Color(0xFF2563EB)),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'شناختی کارڈ / ضروری کاغذات',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                  ),
                ),
                Icon(
                  docsOpen ? Icons.remove_circle_outline_rounded : Icons.add_circle_outline_rounded,
                  size: 16,
                  color: const Color(0xFF64748B),
                ),
              ],
            ),
          ),
        ),
        if (docsOpen) ...[
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: _buildDocPlaceholder('شناختی کارڈ (سامنے)')),
              const SizedBox(width: 10),
              Expanded(child: _buildDocPlaceholder('شناختی کارڈ (پیچھے)')),
            ],
          ),
        ],
      ],
    );
  }
}