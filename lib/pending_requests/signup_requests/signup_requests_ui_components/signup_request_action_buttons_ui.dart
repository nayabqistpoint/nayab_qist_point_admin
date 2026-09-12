import 'package:flutter/material.dart';

class SignupRequestActionButtonsUi extends StatelessWidget {
  final VoidCallback onApprove;
  final VoidCallback onReject;

  const SignupRequestActionButtonsUi({
    super.key,
    required this.onApprove,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // تصدیق
        Expanded(
          child: InkWell(
            onTap: onApprove,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 38,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1E293B), Color(0xFF475569)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_rounded, color: Color(0xFF34D399), size: 16),
                    SizedBox(width: 5),
                    Text(
                      'تصدیق',
                      style: TextStyle(color: Colors.white, fontSize: 12.5, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        // تردید
        Expanded(
          child: InkWell(
            onTap: onReject,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 38,
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF94A3B8), width: 1.1),
              ),
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.close_rounded, color: Color(0xFF64748B), size: 16),
                    SizedBox(width: 5),
                    Text(
                      'تردید',
                      style: TextStyle(color: Color(0xFF334155), fontSize: 12.5, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}