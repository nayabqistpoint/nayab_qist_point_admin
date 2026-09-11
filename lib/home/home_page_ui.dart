import 'package:flutter/material.dart';
import 'package:nayab_qist_point_admin/home/net_balance/net_balance_ui.dart';
import 'package:nayab_qist_point_admin/home/business_summary/business_summary_ui.dart';
import 'package:nayab_qist_point_admin/home/quick_nav/quick_nav_ui.dart';
import 'package:nayab_qist_point_admin/home/customer_action_bar/customer_action_bar_ui.dart';
import 'package:nayab_qist_point_admin/home/customer_list/customer_list_ui.dart';
import 'package:nayab_qist_point_admin/home/admin_action_center/admin_action_center_ui.dart';

class HomePageUi extends StatelessWidget {
  const HomePageUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'نایاب قسط پوائنٹ',
              style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
              'ایڈمن ڈیش بورڈ',
              style: TextStyle(fontSize: 10, color: Colors.white70),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu_rounded, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // 🎯 1. اوپر والے کارڈز جو اوپر سکرول ہو جائیں گے
                const SliverToBoxAdapter(
                  child: Column(
                    children: [
                      NetBalanceUi(),      // خالص کیش
                      BusinessSummaryUi(), // بزنس سمری
                      QuickNavUi(),        // کوئیک نیویگیشن
                    ],
                  ),
                ),

                // 🎯 2. فریز ایکشن بار (155px اونچائی کے ساتھ اوور فلو مکمل ختم)
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _StickyActionBarDelegate(
                    child: Container(
                      color: const Color(0xFFF1F5F9), // بیک گراؤنڈ جس پر کارڈ لٹکا رہے گا
                      child: const CustomerActionBarUi(),
                    ),
                  ),
                ),

                // 🎯 3. کسٹمر لسٹ جو بالکل فریز کارڈ کے نچلے بارڈر سے شروع ہوگی
                const SliverFillRemaining(
                  hasScrollBody: true,
                  child: CustomerListUi(),
                ),
              ],
            ),
          ),

          // 🎯 4. فکسڈ باٹم ایکشن بار
          const AdminActionCenterUi(),
        ],
      ),
    );
  }
}

// 🎯 ایکشن بار کے لیے فریز ڈیلیگیٹ
class _StickyActionBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _StickyActionBarDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  // 🎯 اونچائی 155.0 کر دی گئی ہے تاکہ 9 pixels کا اوور فلو مکمل ختم ہو جائے
  @override
  double get maxExtent => 155.0;

  @override
  double get minExtent => 155.0;

  @override
  bool shouldRebuild(covariant _StickyActionBarDelegate oldDelegate) {
    return oldDelegate.child != child;
  }
}