import 'package:flutter/material.dart';
import 'package:nayab_qist_point_admin/theme/app_themes.dart';
import 'package:nayab_qist_point_admin/home/home_page_logic.dart';

// چھ ماڈیولز کی امپورٹس
import 'package:nayab_qist_point_admin/home/net_balance/net_balance_ui.dart';
import 'package:nayab_qist_point_admin/home/business_summary/business_summary_ui.dart';
import 'package:nayab_qist_point_admin/home/quick_nav/quick_nav_ui.dart';
import 'package:nayab_qist_point_admin/home/admin_action_center/admin_action_center_ui.dart';
import 'package:nayab_qist_point_admin/home/customer_action_bar/customer_action_bar_ui.dart';
import 'package:nayab_qist_point_admin/home/customer_list/customer_list_ui.dart';

class HomePageUI extends StatefulWidget {
  const HomePageUI({super.key});

  @override
  State<HomePageUI> createState() => _HomePageUIState();
}

class _HomePageUIState extends State<HomePageUI> {
  final HomePageLogic logic = HomePageLogic();

  @override
  void initState() {
    super.initState();
    logic.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final theme = logic.isSlateTheme
        ? AppThemes.slateDarkTheme
        : AppThemes.deepEmeraldTheme;

    return Theme(
      data: theme,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('نایاب قسط پوائنٹ (ایڈمن ڈیش بورڈ)'),
          actions: [
            IconButton(
              tooltip: 'تھیم تبدیل کریں',
              icon: Icon(
                logic.isSlateTheme ? Icons.color_lens_outlined : Icons.color_lens,
                color: Colors.white,
              ),
              onPressed: logic.toggleTheme,
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              NetBalanceUI(),               // 1. نیٹ بیلنس کارڈ
              SizedBox(height: 16),
              BusinessSummaryUI(),          // 2. مالیاتی خلاصہ
              SizedBox(height: 16),
              QuickNavUI(),                 // 3. کوئیک نیویگیشن آئیکنز
              SizedBox(height: 16),
              AdminActionCenterUI(),        // 4. ایکشن سینٹر (پینڈنگ ریکویسٹس)
              SizedBox(height: 16),
              CustomerActionBarUI(),        // 5. سرچ و فلٹرز
              SizedBox(height: 16),
              CustomerListUI(),             // 6. کسٹمرز لسٹ
            ],
          ),
        ),
      ),
    );
  }
}