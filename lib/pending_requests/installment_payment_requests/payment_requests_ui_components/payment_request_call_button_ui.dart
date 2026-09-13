import 'package:flutter/material.dart';

class PaymentRequestCallButtonUi extends StatelessWidget {
  final String phone;
  final VoidCallback onCall;

  const PaymentRequestCallButtonUi({
    super.key,
    required this.phone,
    required this.onCall,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCall,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFECFDF5),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFA7F3D0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.phone_forwarded_rounded, size: 15, color: Color(0xFF059669)),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                'کسٹمر کو کال ملائیں ($phone)',
                style: const TextStyle(fontSize: 11.5, color: Color(0xFF059669), fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}