import 'package:flutter/material.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  int selectedLayoutTheme = 1;
  String activeFilter = 'All';

  // 🎯 پینڈنگ درخواستوں کے کاؤنٹرز
  int signupRequestsCount = 3;
  int loginResetRequestsCount = 1;
  int installmentRequestsCount = 5;
  int orderRequestsCount = 2;

  @override
  Widget build(BuildContext context) {
    final theme = _getThemeData();

    return Scaffold(
      backgroundColor: theme.bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.appBarColor,
        foregroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'نایاب قسط پوائنٹ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'ایڈمن ڈیش بورڈ (دیزاین $selectedLayoutTheme)',
              style: const TextStyle(fontSize: 11, color: Colors.white70),
            ),
          ],
        ),
        actions: [
          PopupMenuButton<int>(
            icon: const Icon(Icons.palette_rounded, color: Colors.yellowAccent),
            tooltip: 'تھیم بدلیں',
            onSelected: (int item) {
              setState(() {
                selectedLayoutTheme = item;
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
              const PopupMenuItem<int>(value: 1, child: Text('1. Executive Emerald (زمردی کاپوریٹ)')),
              const PopupMenuItem<int>(value: 2, child: Text('2. Modern Minimal Slate (سلیٹ ڈارک)')),
              const PopupMenuItem<int>(value: 3, child: Text('3. Royal Navy Finance (رائل نیوی)')),
              const PopupMenuItem<int>(value: 4, child: Text('4. Soft Mint Light (سافٹ لائٹ)')),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.storage_rounded),
            tooltip: 'Hive / Database',
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // =========================================================
                    // 1. ٹاپ نیٹ کیش + بینکس انٹری پوائنٹ (Net & Banks Entry)
                    // =========================================================
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: theme.cardGradient,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: theme.cardShadowColor,
                            blurRadius: 15,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'موجودہ خالص کیش (Net Balance)',
                                style: TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w500),
                              ),

                              // 🏦 بینکس اور والٹس کی تفصیل کا سرا (Arrow Entry Point)
                              InkWell(
                                onTap: () {
                                  // آئندہ بینکس لسٹ اور ڈیٹیل پیج یہاں سے کھلے گا
                                },
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: Colors.white30),
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(Icons.account_balance_wallet_rounded, color: Colors.white, size: 14),
                                      SizedBox(width: 4),
                                      Text(
                                        'بینکس لسٹ (5)',
                                        style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                                      ),
                                      Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 10),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Rs. 4,85,200',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),

                          const SizedBox(height: 14),
                          const Divider(color: Colors.white24, height: 1),
                          const SizedBox(height: 12),

                          // 🎯 پینڈنگ وصولی ٹریکر
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Row(
                                children: [
                                  Icon(Icons.pending_actions_rounded, color: Colors.amberAccent, size: 18),
                                  SizedBox(width: 6),
                                  Text(
                                    'پینڈنگ قسط کی درخواستیں (5):',
                                    style: TextStyle(color: Colors.white, fontSize: 12),
                                  ),
                                ],
                              ),
                              const Text(
                                'Rs. 28,500',
                                style: TextStyle(
                                  color: Colors.amberAccent,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // =========================================================
                    // 2. فنانشل پلس / بزنس رپورٹنگ میٹرکس (Financial Pulse Entry)
                    // =========================================================
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'مالیاتی خلاصہ (Business Summary)',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text('تفصیل رپورٹ >', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 85,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        children: [
                          _buildBusinessMetricCard('کل سرمایہ کاری', 'Rs. 25,00,000', Icons.pie_chart_rounded, Colors.purple),
                          _buildBusinessMetricCard('موبائل سٹاک مالیات', 'Rs. 8,40,000', Icons.phone_android_rounded, Colors.teal),
                          _buildBusinessMetricCard('ماہانہ اخراجات', 'Rs. 32,000', Icons.receipt_long_rounded, Colors.orange.shade800),
                          _buildBusinessMetricCard('خالص منافع (P&L)', 'Rs. 1,45,000', Icons.trending_up_rounded, Colors.green.shade700),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // =========================================================
                    // 3. سلائیڈ ایبل ٹوٹل کارڈز (3 Cards: 2 Visible)
                    // =========================================================
                    SizedBox(
                      height: 110,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const PageScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        children: [
                          _buildSummaryCard(
                            title: 'کل وصولی (لینا ہے)',
                            amount: 'Rs. 12,40,000',
                            color: Colors.green.shade700,
                            icon: Icons.arrow_downward_rounded,
                            bgColor: Colors.green.shade50,
                          ),
                          _buildSummaryCard(
                            title: 'کل زاید / دینا (Red)',
                            amount: 'Rs. 45,000',
                            color: Colors.red.shade700,
                            icon: Icons.arrow_upward_rounded,
                            bgColor: Colors.red.shade50,
                          ),
                          _buildSummaryCard(
                            title: 'آج کی وصولی (Today)',
                            amount: 'Rs. 68,500',
                            color: Colors.blue.shade800,
                            icon: Icons.today_rounded,
                            bgColor: Colors.blue.shade50,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // =========================================================
                    // 4. مینیجمنٹ گریڈ انٹری پوائنٹس (Quick Modules Entry Points)
                    // =========================================================
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildModuleTile(
                            icon: Icons.inventory_2_rounded,
                            title: 'موبائل سٹاک',
                            subtitle: '42 آئٹمز اویلیبل',
                            color: Colors.teal,
                            onTap: () {},
                          ),
                          _buildModuleTile(
                            icon: Icons.account_balance_rounded,
                            title: 'بینک کھاتے',
                            subtitle: '5 بینکس کنیکٹڈ',
                            color: Colors.indigo,
                            onTap: () {},
                          ),
                          _buildModuleTile(
                            icon: Icons.money_off_rounded,
                            title: 'اخراجات',
                            subtitle: 'روزنامچہ لاگ',
                            color: Colors.deepOrange,
                            onTap: () {},
                          ),
                          _buildModuleTile(
                            icon: Icons.analytics_rounded,
                            title: 'منافع و نقصان',
                            subtitle: 'P&L ٹریکر',
                            color: Colors.green.shade800,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),

                    // =========================================================
                    // 5. سرچ باکس اور ایڈ پارٹی بٹن (Search & Add Party)
                    // =========================================================
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 46,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: Colors.grey.shade300),
                                boxShadow: [
                                  BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 6, offset: const Offset(0, 2))
                                ],
                              ),
                              child: const TextField(
                                decoration: InputDecoration(
                                  hintText: 'کسٹمر نام یا نمبر تلاش کریں...',
                                  hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                                  prefixIcon: Icon(Icons.search_rounded, color: Colors.grey, size: 20),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.person_add_alt_1_rounded, size: 18),
                            label: const Text('نیا کسٹمر', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: theme.primaryColor,
                              foregroundColor: Colors.white,
                              minimumSize: const Size(0, 46),
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                              padding: const EdgeInsets.symmetric(horizontal: 14),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    // =========================================================
                    // 6. فلٹر چپس (All, Overdue, Clear, Advance)
                    // =========================================================
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          _buildFilterChip('تمام کسٹمرز', 'All'),
                          _buildFilterChip('⚠️ لیٹ قسط (Overdue)', 'Overdue', color: Colors.red),
                          _buildFilterChip('کلئیر کھاتے', 'Clear', color: Colors.green),
                          _buildFilterChip('زاید جمع (Advance)', 'Advance', color: Colors.blue),
                        ],
                      ),
                    ),

                    const SizedBox(height: 14),

                    // =========================================================
                    // 7. کسٹمر لسٹ (Customer Ledger Rows)
                    // =========================================================
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        separatorBuilder: (context, index) => const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          final customers = [
                            {'name': 'محمد افضل', 'phone': '0300-1234567', 'balance': 'Rs. 35,000', 'status': '15 دن لیٹ', 'isOverdue': true},
                            {'name': 'علی رضا', 'phone': '0321-9876543', 'balance': 'Rs. 12,000', 'status': 'کلئیر', 'isOverdue': false},
                            {'name': 'طارق محمود', 'phone': '0304-5554433', 'balance': 'Rs. -2,500', 'status': 'زاید جمع', 'isOverdue': false},
                            {'name': 'عمران خان', 'phone': '0311-2223344', 'balance': 'Rs. 85,000', 'status': '30 دن لیٹ', 'isOverdue': true},
                          ];

                          final item = customers[index];
                          final bool isOverdue = item['isOverdue'] as bool;
                          final bool isAdvance = (item['balance'] as String).contains('-');

                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: isOverdue ? Colors.red.shade200 : Colors.grey.shade200,
                                width: isOverdue ? 1.5 : 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.02),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                              leading: CircleAvatar(
                                backgroundColor: isOverdue ? Colors.red.shade50 : Colors.green.shade50,
                                child: Text(
                                  (item['name'] as String)[0],
                                  style: TextStyle(
                                    color: isOverdue ? Colors.red.shade800 : Colors.green.shade800,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              title: Row(
                                children: [
                                  Text(
                                    item['name'] as String,
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                  ),
                                  const SizedBox(width: 8),
                                  if (isOverdue)
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.red.shade100,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        item['status'] as String,
                                        style: TextStyle(fontSize: 9, color: Colors.red.shade900, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                ],
                              ),
                              subtitle: Text(
                                item['phone'] as String,
                                style: const TextStyle(fontSize: 11, color: Colors.grey),
                              ),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    item['balance'] as String,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: isAdvance ? Colors.blue.shade700 : (isOverdue ? Colors.red.shade700 : Colors.green.shade700),
                                    ),
                                  ),
                                  Text(
                                    isAdvance ? 'زاید جمع' : 'باقی قسط',
                                    style: TextStyle(fontSize: 10, color: isAdvance ? Colors.blue : (isOverdue ? Colors.red : Colors.green)),
                                  ),
                                ],
                              ),
                              onTap: () {},
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            // =================================================================
            // 8. باٹم پینڈنگ درخواستوں کی بار (Pending Requests Badges Bar)
            // =================================================================
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 15,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildRequestBadgeItem(
                    icon: Icons.person_add_rounded,
                    label: 'سائن اپ',
                    badgeCount: signupRequestsCount,
                    color: Colors.blue.shade700,
                    onTap: () {},
                  ),
                  _buildRequestBadgeItem(
                    icon: Icons.lock_reset_rounded,
                    label: 'لاگ ان / PIN',
                    badgeCount: loginResetRequestsCount,
                    color: Colors.orange.shade800,
                    onTap: () {},
                  ),
                  _buildRequestBadgeItem(
                    icon: Icons.account_balance_wallet_rounded,
                    label: 'قسط کی ادائیگی',
                    badgeCount: installmentRequestsCount,
                    color: Colors.green.shade700,
                    onTap: () {},
                  ),
                  _buildRequestBadgeItem(
                    icon: Icons.shopping_bag_rounded,
                    label: 'نیا آرڈر',
                    badgeCount: orderRequestsCount,
                    color: Colors.purple.shade700,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 📊 مالیاتی میٹرک کارڈ ہیلپر
  Widget _buildBusinessMetricCard(String label, String value, IconData icon, Color color) {
    return Container(
      width: 140,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(icon, size: 14, color: color),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 10, color: Colors.grey.shade700, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: color),
          ),
        ],
      ),
    );
  }

  // 🎛️ مینیجمنٹ گریڈ انٹری پوائنٹ ہولڈر
  Widget _buildModuleTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    final width = (MediaQuery.of(context).size.width / 4) - 14;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(height: 6),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 8, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  // 🏷️ فلٹر چپ کا وگیٹ
  Widget _buildFilterChip(String label, String value, {Color? color}) {
    final bool isSelected = activeFilter == value;
    final chipColor = color ?? themeColorFromTheme();

    return Padding(
      padding: const EdgeInsets.only(right: 6.0),
      child: ChoiceChip(
        label: Text(label, style: TextStyle(fontSize: 11, color: isSelected ? Colors.white : Colors.black87, fontWeight: FontWeight.bold)),
        selected: isSelected,
        selectedColor: chipColor,
        backgroundColor: Colors.white,
        elevation: isSelected ? 2 : 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide(color: isSelected ? chipColor : Colors.grey.shade300)),
        onSelected: (bool selected) {
          setState(() {
            activeFilter = value;
          });
        },
      ),
    );
  }

  Color themeColorFromTheme() {
    switch (selectedLayoutTheme) {
      case 2:
        return Colors.blueGrey.shade800;
      case 3:
        return Colors.indigo.shade800;
      case 4:
        return Colors.teal.shade700;
      default:
        return Colors.green.shade800;
    }
  }

  Widget _buildSummaryCard({
    required String title,
    required String amount,
    required Color color,
    required IconData icon,
    required Color bgColor,
  }) {
    final cardWidth = (MediaQuery.of(context).size.width / 2) - 18;

    return Container(
      width: cardWidth,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: color),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: color),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            amount,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
          ),
        ],
      ),
    );
  }

  Widget _buildRequestBadgeItem({
    required IconData icon,
    required String label,
    required int badgeCount,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: color, size: 24),
                ),
                if (badgeCount > 0)
                  Positioned(
                    top: -2,
                    right: -2,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
                      child: Text(
                        '$badgeCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

  _ThemeConfig _getThemeData() {
    switch (selectedLayoutTheme) {
      case 2:
        return _ThemeConfig(
          appBarColor: const Color(0xFF1E293B),
          bgColor: const Color(0xFFF1F5F9),
          primaryColor: const Color(0xFF334155),
          cardGradient: const LinearGradient(colors: [Color(0xFF0F172A), Color(0xFF334155)]),
          cardShadowColor: Colors.black12,
        );
      case 3:
        return _ThemeConfig(
          appBarColor: const Color(0xFF1E1B4B),
          bgColor: const Color(0xFFEEF2FF),
          primaryColor: const Color(0xFF3730A3),
          cardGradient: const LinearGradient(colors: [Color(0xFF312E81), Color(0xFF4338CA)]),
          cardShadowColor: Colors.indigo.withValues(alpha: 0.3),
        );
      case 4:
        return _ThemeConfig(
          appBarColor: const Color(0xFF0D9488),
          bgColor: const Color(0xFFF0FDFA),
          primaryColor: const Color(0xFF0D9488),
          cardGradient: const LinearGradient(colors: [Color(0xFF115E59), Color(0xFF0D9488)]),
          cardShadowColor: Colors.teal.withValues(alpha: 0.2),
        );
      default:
        return _ThemeConfig(
          appBarColor: Colors.green.shade800,
          bgColor: const Color(0xFFF4F6F9),
          primaryColor: Colors.green.shade800,
          cardGradient: LinearGradient(colors: [Colors.green.shade900, Colors.green.shade700]),
          cardShadowColor: Colors.green.shade900.withValues(alpha: 0.25),
        );
    }
  }
}

class _ThemeConfig {
  final Color appBarColor;
  final Color bgColor;
  final Color primaryColor;
  final LinearGradient cardGradient;
  final Color cardShadowColor;

  _ThemeConfig({
    required this.appBarColor,
    required this.bgColor,
    required this.primaryColor,
    required this.cardGradient,
    required this.cardShadowColor,
  });
}