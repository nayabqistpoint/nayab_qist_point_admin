// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class PinLoginRequests extends StatelessWidget {
  const PinLoginRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF1F5F9),
        
        // 🎯 بالکل یکساں 72px سلیٹ گریڈینٹ ایپ بار
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(72),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFF1E293B),
                  Color(0xFF334155),
                  Color(0xFF475569),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x22000000),
                  blurRadius: 8,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  children: [
                    // بیک بٹن باکس
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white.withOpacity(0.18)),
                        ),
                        child: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 18),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'درخواست برائے PIN / لاگ ان',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 0.2,
                          ),
                        ),
                        Text(
                          'نایاب قسط پوائنٹ',
                          style: TextStyle(fontSize: 11, color: Color(0xFFCBD5E1)),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.14),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: Colors.white.withOpacity(0.2)),
                      ),
                      child: const Text(
                        'باقی: 1',
                        style: TextStyle(fontSize: 12, color: Color(0xFFFDE68A), fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: const Center(
          child: Text(
            'PIN ری سیٹ / لاگ ان کی درخواستیں یہاں آئیں گی',
            style: TextStyle(fontSize: 15, color: Color(0xFF64748B), fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}