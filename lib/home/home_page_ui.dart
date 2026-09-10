import 'package:flutter/material.dart';
import 'package:nayab_qist_point_admin/home/net_balance/net_balance_ui.dart';
import 'package:nayab_qist_point_admin/home/business_summary/business_summary_ui.dart';
import 'package:nayab_qist_point_admin/home/quick_nav/quick_nav_ui.dart';
import 'package:nayab_qist_point_admin/home/admin_action_center/admin_action_center_ui.dart';
import 'package:nayab_qist_point_admin/home/customer_action_bar/customer_action_bar_ui.dart';
import 'package:nayab_qist_point_admin/home/customer_list/customer_list_ui.dart';

class HomePageUi extends StatelessWidget {
  const HomePageUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B), // Slate Dark Header
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('نایاب قسط پوائنٹ', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
            Text('ایڈمن ڈیش بورڈ (دیزاین 2)', style: TextStyle(fontSize: 10, color: Colors.white70)),
          ],
        ),
      ),
      body: const Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  NetBalanceUi(),          // 1. خالص کیش
                  BusinessSummaryUi(),     // 2. مالیاتی خلاصہ
                  QuickNavUi(),            // 3. کوئیک نیویگیشن
                  CustomerActionBarUi(),   // 5. سرچ بار + نیا کسٹمر
                  CustomerListUi(),        // 6. کسٹمر لسٹ
                ],
              ),
            ),
          ),
          AdminActionCenterUi(),           // 4. باٹم ایکشن بار (پینڈنگ بیجز)
        ],
      ),
    );
  }
}