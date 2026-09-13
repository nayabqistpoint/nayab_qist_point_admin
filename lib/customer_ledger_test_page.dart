// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CustomerLedgerTestPage extends StatefulWidget {
  const CustomerLedgerTestPage({super.key});

  @override
  State<CustomerLedgerTestPage> createState() => _CustomerLedgerTestPageState();
}

class _CustomerLedgerTestPageState extends State<CustomerLedgerTestPage> {
  int _selectedTabIndex = 0; // 0 = اقساط، 1 = نقد قرض، 2 = خدمات و سامان

  int _selectedProductIndex = 0;
  final List<Map<String, dynamic>> customerProducts = [
    {
      'id': 'P-101',
      'name': 'Infinix Note 40 Pro',
      'plan': '10 ماہ پلان',
      'total': 75600,
      'paid': 22680,
      'monthlyInstallment': 7560,
      'schedule': [
        {'no': 1, 'date': '05 جولائی 2026', 'amount': 7560, 'status': 'PAID'},
        {'no': 2, 'date': '05 اگست 2026', 'amount': 7560, 'status': 'PAID'},
        {'no': 3, 'date': '05 ستمبر 2026', 'amount': 7560, 'status': 'PAID'},
        {'no': 4, 'date': '05 اکتوبر 2026', 'amount': 7560, 'status': 'DUE'},
        {'no': 5, 'date': '05 نومبر 2026', 'amount': 7560, 'status': 'UPCOMING'},
      ],
    },
    {
      'id': 'P-102',
      'name': 'Vivo Y21',
      'plan': '8 ماہ پلان',
      'total': 47500,
      'paid': 15936,
      'monthlyInstallment': 5312,
      'schedule': [
        {'no': 1, 'date': '05 جولائی 2026', 'amount': 5312, 'status': 'PAID'},
        {'no': 2, 'date': '05 اگست 2026', 'amount': 5312, 'status': 'PAID'},
        {'no': 3, 'date': '05 ستمبر 2026', 'amount': 5312, 'status': 'PAID'},
        {'no': 4, 'date': '05 اکتوبر 2026', 'amount': 5312, 'status': 'DUE'},
      ],
    },
  ];

  int cashLoanBalance = 50000;
  final List<Map<String, dynamic>> cashLoanEntries = [
    {'title': 'دکان سے نقد دستی کیش لیا', 'date': '10 اگست 2026', 'amount': 50000, 'type': 'DEBIT'},
  ];

  int serviceAdjustmentCredit = 14500;

  // خدمات و سامان کا ریکارڈ مع ڈسکاؤنٹ/ایکسپنس میپنگ
  final List<Map<String, dynamic>> serviceTransactions = [
    {
      'title': 'ماہانہ کریانہ راشن بل',
      'nature': 'EXPENSE',
      'natureTitle': 'دکان و راشن خرچہ',
      'isExpanded': false,
      'syncStatus': 'ADMIN_APPROVED',
      'items': [
        {'name': 'چینی (10 کلو)', 'amount': 1500},
        {'name': 'گھی کا ڈبہ (5 لیٹر)', 'amount': 2850},
        {'name': 'چاول سپر کرنل (10 کلو)', 'amount': 3900},
        {'name': 'دال چنا و مسور', 'amount': 1350},
      ],
      'expenseAllocations': [
        {'category': 'گھریلو راشن و گروسری (ڈائریکٹ ایکسپنس)', 'amount': 8250},
        {'category': 'دکان چائے پانی / اخراجات (ان ڈائریکٹ ایکسپنس)', 'amount': 1350},
      ],
      'totalAmount': 9600,
      'target': 'Infinix قسط کھاتہ',
      'hasAudio': true,
      'hasPhoto': true,
      'date': '09 ستمبر 2026',
    },
    {
      'title': 'موبائل فروخت بذریعہ کسٹمر',
      'nature': 'STOCK',
      'natureTitle': 'اسٹاک تبادلہ (موبائل)',
      'isExpanded': false,
      'syncStatus': 'FIRESTORE_PUSHED',
      'items': [
        {
          'name': 'Samsung Galaxy A12',
          'amount': 4900,
          'ramRom': '4GB / 64GB',
          'condition': 'استعمال شدہ (Used)',
          'imei': '354890123456789',
          'warranty': 'چیکنگ وارنٹی (3 دن)',
        },
      ],
      'expenseAllocations': [],
      'totalAmount': 4900,
      'target': 'نقد دستی ادھار',
      'hasAudio': false,
      'hasPhoto': true,
      'date': '12 ستمبر 2026',
    },
  ];

  final List<String> configPaymentSources = [
    'دکان کیش دراز',
    'JazzCash (جاز کیش)',
    'EasyPaisa (ایزی پیسہ)',
    'Meezan Bank (میزان)',
    'Allied Bank (الائیڈ)',
  ];

  // ایپ کنفگ ہائیو باکس کی ڈسکاؤنٹ و ایکسپنس کیٹیگریز
  final List<String> configExpenseCategories = [
    'گھریلو راشن و گروسری (ڈائریکٹ ایکسپنس)',
    'دکان چائے پانی / اخراجات (ان ڈائریکٹ ایکسپنس)',
    'رعایت / خصوصی ڈسکاؤنٹ (ڈائریکٹ ایکسپنس)',
    'دکان مرمت و سروس ورکشاپ (ان ڈائریکٹ ایکسپنس)',
    'دیگر متفرق اخراجات (General Expense)',
  ];

  final List<Map<String, dynamic>> configAdjustmentCategories = [
    {'name': 'رعایت / ڈسکاؤنٹ (ڈائریکٹ ایکسپنس)', 'isIncome': false},
    {'name': 'گروسری / راشن خرچہ (ڈائریکٹ ایکسپنس)', 'isIncome': false},
    {'name': 'دکان سروس / مزدوری (ان ڈائریکٹ ایکسپنس)', 'isIncome': false},
    {'name': 'لیٹ فیس / اضافی وصولی (ادر انکم)', 'isIncome': true},
  ];

  int get totalInstallmentDue {
    return customerProducts.fold(0, (sum, p) => sum + ((p['total'] as int) - (p['paid'] as int)));
  }

  int get approvedServiceCredit {
    return serviceTransactions
        .where((t) => t['syncStatus'] == 'ADMIN_APPROVED')
        .fold(0, (sum, t) => sum + (t['totalAmount'] as int));
  }

  int get grandNetTotal => (totalInstallmentDue + cashLoanBalance) - approvedServiceCredit;

  Widget _buildSyncStatusBadge(String status) {
    if (status == 'ADMIN_APPROVED') {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(color: const Color(0xFFDCFCE7), borderRadius: BorderRadius.circular(4)),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('منظور', style: TextStyle(fontSize: 9.5, color: Color(0xFF15803D), fontWeight: FontWeight.bold)),
            SizedBox(width: 3),
            Icon(Icons.done_all_rounded, size: 14, color: Color(0xFF16A34A)),
          ],
        ),
      );
    } else if (status == 'FIRESTORE_PUSHED') {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(4)),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('زیرِ التوا', style: TextStyle(fontSize: 9.5, color: Color(0xFF64748B), fontWeight: FontWeight.bold)),
            SizedBox(width: 3),
            Icon(Icons.done_all_rounded, size: 14, color: Color(0xFF94A3B8)),
          ],
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(color: const Color(0xFFFEF3C7), borderRadius: BorderRadius.circular(4)),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('محفوظ', style: TextStyle(fontSize: 9.5, color: Color(0xFFB45309), fontWeight: FontWeight.bold)),
            SizedBox(width: 3),
            Icon(Icons.check_rounded, size: 14, color: Color(0xFFD97706)),
          ],
        ),
      );
    }
  }

  // ===========================================================================
  // 🎯 یونیورسل اسپلٹ پیمنٹ انجن
  // ===========================================================================
  void _openPaymentModal({
    required String title,
    required int baseAmount,
    required bool isInstallment,
    required Function(int totalResolved, int actualPaid, int discount, int extra, List<Map<String, dynamic>> splits, String note, bool hasPhoto, bool hasAudio) onComplete,
  }) {
    final TextEditingController targetAmountCtrl = TextEditingController(text: baseAmount.toString());
    final TextEditingController noteCtrl = TextEditingController();
    bool isPartial = false;
    bool hasPhoto = false;
    bool hasAudio = false;

    List<Map<String, dynamic>> splitEntries = [
      {'source': configPaymentSources.first, 'amount': baseAmount},
    ];

    int selectedAdjIndex = 0;
    final TextEditingController adjAmountCtrl = TextEditingController(text: '0');

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            int targetPayable = int.tryParse(targetAmountCtrl.text) ?? 0;
            int shortAmount = baseAmount - targetPayable;

            int splitsSum = splitEntries.fold(0, (sum, item) => sum + ((item['amount'] as int?) ?? 0));
            int adjVal = int.tryParse(adjAmountCtrl.text) ?? 0;
            bool isIncome = configAdjustmentCategories[selectedAdjIndex]['isIncome'] as bool;

            int requiredCashFromSources = isIncome ? (targetPayable + adjVal) : (targetPayable - adjVal);
            int difference = splitsSum - requiredCashFromSources;
            bool isReconciled = (difference == 0) && (splitsSum > 0 || adjVal > 0);

            return Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                  top: 14,
                  left: 14,
                  right: 14,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Container(width: 36, height: 4, decoration: BoxDecoration(color: const Color(0xFFCBD5E1), borderRadius: BorderRadius.circular(10)))),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                          Text('مقررہ بل: Rs. $baseAmount', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF2563EB))),
                        ],
                      ),
                      const Divider(height: 18),

                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setSheetState(() {
                                  isPartial = false;
                                  targetAmountCtrl.text = baseAmount.toString();
                                  if (splitEntries.isNotEmpty) splitEntries[0]['amount'] = baseAmount;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(color: !isPartial ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(8)),
                                child: Text('مکمل ادا (Rs. $baseAmount)', textAlign: TextAlign.center, style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, color: !isPartial ? Colors.white : const Color(0xFF475569))),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setSheetState(() {
                                  isPartial = true;
                                  int half = (baseAmount / 2).toInt();
                                  targetAmountCtrl.text = half.toString();
                                  if (splitEntries.isNotEmpty) splitEntries[0]['amount'] = half;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(color: isPartial ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(8)),
                                child: const Text('جزوی ادائیگی (تھوڑی رقم)', textAlign: TextAlign.center, style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      if (isPartial) ...[
                        TextFormField(
                          controller: targetAmountCtrl,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                          onChanged: (val) {
                            setSheetState(() {
                              int p = int.tryParse(val) ?? 0;
                              if (splitEntries.isNotEmpty) splitEntries[0]['amount'] = p;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'مطلوبہ ادائیگی کا ہدف درج کریں',
                            prefixText: 'Rs. ',
                            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                        if (shortAmount > 0)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text('بقیہ Rs. $shortAmount شارٹ کھاتے میں زیرِ التوا رہیں گے۔', style: const TextStyle(fontSize: 11, color: Color(0xFFDC2626), fontWeight: FontWeight.bold)),
                          ),
                        const SizedBox(height: 8),
                      ],

                      // ایڈجسٹمنٹ کیٹیگری (ڈسکاؤنٹ یا ادر انکم)
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(color: const Color(0xFFF8FAFC), borderRadius: BorderRadius.circular(10), border: Border.all(color: const Color(0xFFE2E8F0))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('ایڈجسٹمنٹ کیٹیگری (رعایت، خرچہ یا اضافی فیس):', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF475569))),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6), border: Border.all(color: const Color(0xFFCBD5E1))),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<int>(
                                        value: selectedAdjIndex,
                                        isExpanded: true,
                                        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                                        items: List.generate(
                                          configAdjustmentCategories.length,
                                          (i) => DropdownMenuItem(value: i, child: Text(configAdjustmentCategories[i]['name'])),
                                        ),
                                        onChanged: (v) => setSheetState(() => selectedAdjIndex = v!),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Expanded(
                                  flex: 2,
                                  child: TextFormField(
                                    controller: adjAmountCtrl,
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: isIncome ? const Color(0xFF2563EB) : const Color(0xFF15803D)),
                                    onChanged: (_) => setSheetState(() {}),
                                    decoration: InputDecoration(
                                      hintText: '0',
                                      prefixText: isIncome ? '+ Rs. ' : '- Rs. ',
                                      prefixStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: isIncome ? const Color(0xFF2563EB) : const Color(0xFF15803D)),
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),

                      // اسپلٹ پیمنٹ سورسز
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('بینک و کیش سورسز (اسپلٹ ادائیگی):', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                          TextButton.icon(
                            onPressed: () {
                              setSheetState(() {
                                splitEntries.add({'source': configPaymentSources.first, 'amount': 0});
                              });
                            },
                            icon: const Icon(Icons.add_circle_outline_rounded, size: 14),
                            label: const Text('دوسرا سورس جوڑیں', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),

                      ...splitEntries.asMap().entries.map((entry) {
                        int idx = entry.key;
                        Map<String, dynamic> item = entry.value;

                        return Container(
                          margin: const EdgeInsets.only(bottom: 6),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: item['source'],
                                    isExpanded: true,
                                    style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                                    items: configPaymentSources.map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
                                    onChanged: (v) => setSheetState(() => item['source'] = v!),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                flex: 2,
                                child: TextFormField(
                                  initialValue: item['amount'].toString(),
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                  onChanged: (v) {
                                    setSheetState(() {
                                      item['amount'] = int.tryParse(v) ?? 0;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                    prefixText: 'Rs. ',
                                    contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                ),
                              ),
                              if (splitEntries.length > 1)
                                IconButton(
                                  icon: const Icon(Icons.remove_circle_outline, size: 18, color: Color(0xFFDC2626)),
                                  onPressed: () => setSheetState(() => splitEntries.removeAt(idx)),
                                ),
                            ],
                          ),
                        );
                      }),
                      const SizedBox(height: 6),

                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: isReconciled ? const Color(0xFFECFDF5) : const Color(0xFFFEF2F2),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: isReconciled ? const Color(0xFFA7F3D0) : const Color(0xFFFECACA)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              isReconciled ? '✔ سورسز کی رقم مکمل برابر ہے' : '✖ فرق: Rs. ${difference.abs()} (${difference < 0 ? 'رقم کم ہے' : 'رقم زائد ہے'})',
                              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: isReconciled ? const Color(0xFF065F46) : const Color(0xFF991B1B)),
                            ),
                            Text('سورسز: Rs. $splitsSum / ہدف: Rs. $requiredCashFromSources', style: const TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),

                      _buildDescriptionAndMediaBar(
                        noteCtrl: noteCtrl,
                        hasPhoto: hasPhoto,
                        hasAudio: hasAudio,
                        onTogglePhoto: () => setSheetState(() => hasPhoto = !hasPhoto),
                        onToggleAudio: () => setSheetState(() => hasAudio = !hasAudio),
                      ),
                      const SizedBox(height: 14),

                      SizedBox(
                        width: double.infinity,
                        height: 42,
                        child: ElevatedButton(
                          onPressed: isReconciled
                              ? () {
                                  Navigator.pop(context);
                                  onComplete(
                                    targetPayable,
                                    splitsSum,
                                    isIncome ? 0 : adjVal,
                                    isIncome ? adjVal : 0,
                                    splitEntries,
                                    noteCtrl.text,
                                    hasPhoto,
                                    hasAudio,
                                  );
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1E293B),
                            foregroundColor: Colors.white,
                            disabledBackgroundColor: const Color(0xFF94A3B8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            isReconciled ? 'ادائیگی حتمی تصدیق کے لیے بھیجیں' : 'پہلے سورسز اور رعایت کا حساب برابر کریں',
                            style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  // ===========================================================================
  // 🎯 خدمات و سامان / موبائل اسٹاک بلنگ باٹم شیٹ (مع ڈسکاؤنٹ/ایکسپنس میپنگ)
  // ===========================================================================
  void _openMultiItemServiceSheet() {
    final titleCtrl = TextEditingController();
    final noteCtrl = TextEditingController();

    // گروسری فیلڈز
    final itemNameCtrl = TextEditingController();
    final itemAmountCtrl = TextEditingController();

    // موبائل فیلڈز
    final mobileModelCtrl = TextEditingController();
    final mobilePriceCtrl = TextEditingController();
    final ramRomCtrl = TextEditingController();
    final imeiCtrl = TextEditingController();
    String mobileCondition = 'استعمال شدہ (Used)';
    String warrantyStatus = 'وارنٹی ختم (No Warranty)';

    bool hasPhoto = false;
    bool hasAudio = false;

    int selectedNatureIndex = 0; // 0 = دکان و راشن خرچہ، 1 = اسٹاک تبادلہ (موبائل)
    String target = customerProducts.isNotEmpty ? customerProducts[_selectedProductIndex]['name'] : 'نیا / آزاد کسٹمر کریڈٹ کھاتہ';

    List<Map<String, dynamic>> groceryList = [
      {'name': 'چینی (5 کلو)', 'amount': 750},
    ];

    List<Map<String, dynamic>> mobileStockList = [];

    // 🎯 ڈسکاؤنٹ و ایکسپنس الاٹمنٹ لسٹ (پرافٹ اینڈ لاس سنک کے لیے)
    List<Map<String, dynamic>> expenseAllocations = [
      {'category': configExpenseCategories.first, 'amount': 750},
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            bool isStockBarter = selectedNatureIndex == 1;
            int totalBill = isStockBarter
                ? mobileStockList.fold(0, (sum, i) => sum + (i['amount'] as int))
                : groceryList.fold(0, (sum, i) => sum + (i['amount'] as int));

            // اگر گروسری ہو تو ایکسپنس الاٹمنٹ کا ٹوٹل
            int expenseSum = expenseAllocations.fold(0, (sum, e) => sum + ((e['amount'] as int?) ?? 0));
            int expenseDifference = expenseSum - totalBill;
            bool isExpenseReconciled = isStockBarter || (expenseDifference == 0 && totalBill > 0);

            return Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                  top: 14,
                  left: 14,
                  right: 14,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Container(width: 36, height: 4, decoration: BoxDecoration(color: const Color(0xFFCBD5E1), borderRadius: BorderRadius.circular(10)))),
                      const SizedBox(height: 12),
                      const Text('خدمات و سامان / اسٹاک تبادلہ اندراج', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      const Text('کھاتے سے کٹوتی کے لیے راشن بل یا موبائل اسٹاک درج کریں', style: TextStyle(fontSize: 11, color: Color(0xFF64748B))),
                      const Divider(height: 16),

                      // ٹرانزیکشن نوعیت سلیکٹر
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setSheetState(() {
                                  selectedNatureIndex = 0;
                                  if (expenseAllocations.isNotEmpty) {
                                    expenseAllocations[0]['amount'] = totalBill;
                                  }
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(
                                  color: selectedNatureIndex == 0 ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text('دکان و راشن خرچہ (گروسری)', textAlign: TextAlign.center, style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: selectedNatureIndex == 0 ? Colors.white : const Color(0xFF475569))),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: InkWell(
                              onTap: () => setSheetState(() => selectedNatureIndex = 1),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(
                                  color: selectedNatureIndex == 1 ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text('اسٹاک تبادلہ (موبائل)', textAlign: TextAlign.center, style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: selectedNatureIndex == 1 ? Colors.white : const Color(0xFF475569))),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // کٹوتی کھاتہ
                      const Text('کٹوتی کا ٹارگٹ کھاتہ:', style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(color: const Color(0xFFF8FAFC), borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFCBD5E1))),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: target,
                            isExpanded: true,
                            style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, color: Color(0xFF2563EB)),
                            items: [
                              ...customerProducts.map((p) => DropdownMenuItem(value: p['name'] as String, child: Text('قسط کھاتہ: ${p['name']}'))),
                              const DropdownMenuItem(value: 'نقد دستی ادھار', child: Text('نقد دستی ادھار کھاتہ')),
                              const DropdownMenuItem(value: 'نیا / آزاد کسٹمر کریڈٹ کھاتہ', child: Text('نیا / آزاد کسٹمر کریڈٹ کھاتہ (دکان مقروض بنے گی)')),
                            ],
                            onChanged: (v) => setSheetState(() => target = v!),
                          ),
                        ),
                      ),
                      const Divider(height: 16),

                      // =======================================================
                      // 1. اگر گروسری راشن بل ہو تو ملٹیپل اشیاء
                      // =======================================================
                      if (!isStockBarter) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('راشن / گروسری کی اشیاء:', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            Text('کل بل: Rs. $totalBill', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF15803D))),
                          ],
                        ),
                        const SizedBox(height: 6),
                        ...groceryList.asMap().entries.map((e) {
                          int idx = e.key;
                          var item = e.value;
                          return Container(
                            margin: const EdgeInsets.only(bottom: 4),
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                            decoration: BoxDecoration(color: const Color(0xFFF8FAFC), borderRadius: BorderRadius.circular(6)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${idx + 1}. ${item['name']}', style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.w600)),
                                Row(
                                  children: [
                                    Text('Rs. ${item['amount']}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                    if (groceryList.length > 1)
                                      IconButton(
                                        icon: const Icon(Icons.close, size: 16, color: Color(0xFFDC2626)),
                                        onPressed: () {
                                          setSheetState(() {
                                            groceryList.removeAt(idx);
                                            int newT = groceryList.fold(0, (s, i) => s + (i['amount'] as int));
                                            if (expenseAllocations.isNotEmpty) expenseAllocations[0]['amount'] = newT;
                                          });
                                        },
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: itemNameCtrl,
                                decoration: InputDecoration(
                                  hintText: 'چیز کا نام (دال، گھی)',
                                  hintStyle: const TextStyle(fontSize: 11),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                controller: itemAmountCtrl,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'قیمت',
                                  hintStyle: const TextStyle(fontSize: 11),
                                  prefixText: 'Rs. ',
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            ElevatedButton(
                              onPressed: () {
                                if (itemNameCtrl.text.isNotEmpty && itemAmountCtrl.text.isNotEmpty) {
                                  setSheetState(() {
                                    groceryList.add({
                                      'name': itemNameCtrl.text.trim(),
                                      'amount': int.tryParse(itemAmountCtrl.text.trim()) ?? 0,
                                    });
                                    itemNameCtrl.clear();
                                    itemAmountCtrl.clear();
                                    int newT = groceryList.fold(0, (s, i) => s + (i['amount'] as int));
                                    if (expenseAllocations.isNotEmpty) expenseAllocations[0]['amount'] = newT;
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1E293B), foregroundColor: Colors.white, visualDensity: VisualDensity.compact),
                              child: const Text('شامل کریں', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        // 🎯 پرافٹ اینڈ لاس ڈسکاؤنٹ و ایکسپنس الاٹمنٹ انجن (Expense Mapping)
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFEF3C7).withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color(0xFFFDE68A)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('پرافٹ اینڈ لاس خرچہ کھاتہ (ایکسپنس کیٹیگری):', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF92400E))),
                                  TextButton.icon(
                                    onPressed: () {
                                      setSheetState(() {
                                        expenseAllocations.add({'category': configExpenseCategories[1], 'amount': 0});
                                      });
                                    },
                                    icon: const Icon(Icons.add_circle_outline, size: 14, color: Color(0xFFB45309)),
                                    label: const Text('مزید خرچہ ہیڈ جوڑیں', style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold, color: Color(0xFFB45309))),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),

                              ...expenseAllocations.asMap().entries.map((entry) {
                                int eIdx = entry.key;
                                var alloc = entry.value;
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 6),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 6),
                                          decoration: BoxDecoration(color: Colors.white, border: Border.all(color: const Color(0xFFCBD5E1)), borderRadius: BorderRadius.circular(6)),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              value: alloc['category'],
                                              isExpanded: true,
                                              style: const TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                                              items: configExpenseCategories.map((c) => DropdownMenuItem(value: c, child: Text(c, overflow: TextOverflow.ellipsis))).toList(),
                                              onChanged: (v) => setSheetState(() => alloc['category'] = v!),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      Expanded(
                                        flex: 2,
                                        child: TextFormField(
                                          initialValue: alloc['amount'].toString(),
                                          keyboardType: TextInputType.number,
                                          style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold),
                                          onChanged: (val) {
                                            setSheetState(() {
                                              alloc['amount'] = int.tryParse(val) ?? 0;
                                            });
                                          },
                                          decoration: const InputDecoration(
                                            prefixText: 'Rs. ',
                                            contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                                            border: OutlineInputBorder(),
                                            filled: true,
                                            fillColor: Colors.white,
                                          ),
                                        ),
                                      ),
                                      if (expenseAllocations.length > 1)
                                        IconButton(
                                          icon: const Icon(Icons.remove_circle_outline, size: 18, color: Color(0xFFDC2626)),
                                          onPressed: () => setSheetState(() => expenseAllocations.removeAt(eIdx)),
                                        ),
                                    ],
                                  ),
                                );
                              }),

                              // موازنہ بار
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: isExpenseReconciled ? const Color(0xFFECFDF5) : const Color(0xFFFEF2F2),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      isExpenseReconciled ? '✔ خرچہ کیٹیگریز بل سے میچ ہیں' : '✖ فرق: Rs. ${expenseDifference.abs()} (${expenseDifference < 0 ? "رقم کم ہے" : "رقم زائد ہے"})',
                                      style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold, color: isExpenseReconciled ? const Color(0xFF065F46) : const Color(0xFF991B1B)),
                                    ),
                                    Text('خرچہ: Rs. $expenseSum / بل: Rs. $totalBill', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],

                      // =======================================================
                      // 2. اگر موبائل اسٹاک تبادلہ ہو
                      // =======================================================
                      if (isStockBarter) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('موبائل اسٹاک تبادلہ (ملٹیپل فونز):', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            Text('کل فونز: ${mobileStockList.length}', style: const TextStyle(fontSize: 11, color: Color(0xFF2563EB), fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 6),

                        if (mobileStockList.isNotEmpty) ...[
                          ...mobileStockList.asMap().entries.map((entry) {
                            int mIdx = entry.key;
                            var m = entry.value;
                            return Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF1F5F9),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: const Color(0xFFCBD5E1)),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.phone_android_rounded, size: 16, color: Color(0xFF1E293B)),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('${mIdx + 1}. ${m['name']} (${m['ramRom']})', style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold)),
                                        Text('IMEI: ${m['imei'].isEmpty ? "درج نہیں" : m['imei']} | ${m['condition']}', style: const TextStyle(fontSize: 9.5, color: Color(0xFF64748B))),
                                      ],
                                    ),
                                  ),
                                  Text('Rs. ${m['amount']}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF15803D))),
                                  IconButton(
                                    icon: const Icon(Icons.delete_outline_rounded, size: 16, color: Color(0xFFDC2626)),
                                    onPressed: () => setSheetState(() => mobileStockList.removeAt(mIdx)),
                                    visualDensity: VisualDensity.compact,
                                  ),
                                ],
                              ),
                            );
                          }),
                          const Divider(height: 12),
                        ],

                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF8FAFC),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: const Color(0xFFE2E8F0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                mobileStockList.isEmpty ? 'پہلا موبائل درج کریں:' : 'اگلا موبائل لسٹ میں جوڑیں:',
                                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF475569)),
                              ),
                              const SizedBox(height: 6),
                              TextFormField(
                                controller: mobileModelCtrl,
                                decoration: InputDecoration(
                                  hintText: 'موبائل ماڈل (مثلاً Samsung A12, Vivo Y20)',
                                  hintStyle: const TextStyle(fontSize: 11),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: ramRomCtrl,
                                      decoration: InputDecoration(
                                        hintText: 'ریم/میموری (مثلاً 4/64)',
                                        hintStyle: const TextStyle(fontSize: 11),
                                        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: TextFormField(
                                      controller: mobilePriceCtrl,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        hintText: 'طے شدہ قیمت',
                                        hintStyle: const TextStyle(fontSize: 11),
                                        prefixText: 'Rs. ',
                                        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 6),
                                      decoration: BoxDecoration(color: Colors.white, border: Border.all(color: const Color(0xFFCBD5E1)), borderRadius: BorderRadius.circular(6)),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          value: mobileCondition,
                                          isExpanded: true,
                                          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                                          items: const [
                                            DropdownMenuItem(value: 'استعمال شدہ (Used)', child: Text('استعمال شدہ')),
                                            DropdownMenuItem(value: 'نیا ڈبہ پیک (Pin Pack)', child: Text('نیا ڈبہ پیک')),
                                          ],
                                          onChanged: (v) => setSheetState(() => mobileCondition = v!),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 6),
                                      decoration: BoxDecoration(color: Colors.white, border: Border.all(color: const Color(0xFFCBD5E1)), borderRadius: BorderRadius.circular(6)),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          value: warrantyStatus,
                                          isExpanded: true,
                                          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                                          items: const [
                                            DropdownMenuItem(value: 'وارنٹی ختم (No Warranty)', child: Text('وارنٹی ختم')),
                                            DropdownMenuItem(value: '3 دن چیکنگ وارنٹی', child: Text('3 دن چیکنگ')),
                                            DropdownMenuItem(value: 'کمپنی آفیشل وارنٹی', child: Text('کمپنی وارنٹی')),
                                          ],
                                          onChanged: (v) => setSheetState(() => warrantyStatus = v!),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              TextFormField(
                                controller: imeiCtrl,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: '15 ہندسوں کا IMEI نمبر (اختیاری)',
                                  hintStyle: const TextStyle(fontSize: 11),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),

                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    if (mobileModelCtrl.text.trim().isNotEmpty && mobilePriceCtrl.text.trim().isNotEmpty) {
                                      setSheetState(() {
                                        mobileStockList.add({
                                          'name': mobileModelCtrl.text.trim(),
                                          'amount': int.tryParse(mobilePriceCtrl.text.trim()) ?? 0,
                                          'ramRom': ramRomCtrl.text.trim().isEmpty ? 'ڈیٹا نہیں' : ramRomCtrl.text.trim(),
                                          'condition': mobileCondition,
                                          'imei': imeiCtrl.text.trim(),
                                          'warranty': warrantyStatus,
                                        });

                                        mobileModelCtrl.clear();
                                        mobilePriceCtrl.clear();
                                        ramRomCtrl.clear();
                                        imeiCtrl.clear();
                                      });
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text('برائے مہربانی موبائل ماڈل اور قیمت درج کریں!'), backgroundColor: Color(0xFFDC2626)),
                                      );
                                    }
                                  },
                                  icon: const Icon(Icons.add_rounded, size: 16),
                                  label: const Text('پلس موبائل لسٹ میں جوڑیں', style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF2563EB),
                                    foregroundColor: Colors.white,
                                    visualDensity: VisualDensity.compact,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      const SizedBox(height: 10),

                      // ڈسکرپشن، کیمرہ اور آڈیو نوٹ
                      _buildDescriptionAndMediaBar(
                        noteCtrl: noteCtrl,
                        hasPhoto: hasPhoto,
                        hasAudio: hasAudio,
                        onTogglePhoto: () => setSheetState(() => hasPhoto = !hasPhoto),
                        onToggleAudio: () => setSheetState(() => hasAudio = !hasAudio),
                      ),
                      const SizedBox(height: 12),

                      // فائنل جمع بٹن (اگر خرچہ ٹیلی نہ ہو تو ڈس ایبل)
                      SizedBox(
                        width: double.infinity,
                        height: 42,
                        child: ElevatedButton(
                          onPressed: isExpenseReconciled
                              ? () {
                                  final List<Map<String, dynamic>> finalItems = isStockBarter ? List.from(mobileStockList) : List.from(groceryList);
                                  if (finalItems.isNotEmpty) {
                                    setState(() {
                                      serviceTransactions.insert(0, {
                                        'title': titleCtrl.text.isEmpty ? (isStockBarter ? 'موبائل اسٹاک تبادلہ' : 'راشن و گروسری بل') : titleCtrl.text,
                                        'nature': isStockBarter ? 'STOCK' : 'EXPENSE',
                                        'natureTitle': isStockBarter ? 'اسٹاک تبادلہ (موبائل)' : 'دکان و راشن خرچہ',
                                        'isExpanded': false,
                                        'syncStatus': 'FIRESTORE_PUSHED',
                                        'items': finalItems,
                                        'expenseAllocations': isStockBarter ? [] : List.from(expenseAllocations),
                                        'totalAmount': totalBill,
                                        'target': target,
                                        'hasAudio': hasAudio,
                                        'hasPhoto': hasPhoto,
                                        'date': 'آج',
                                      });
                                    });
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Rs. $totalBill کا بل ایڈمن منظوری کے لیے ارسال ہو گیا!'), backgroundColor: const Color(0xFF16A34A)),
                                    );
                                  }
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1E293B),
                            foregroundColor: Colors.white,
                            disabledBackgroundColor: const Color(0xFF94A3B8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            isExpenseReconciled ? 'بل جمع کریں (کل رقم: Rs. $totalBill)' : 'پہلے ایکسپنس کیٹیگریز کا حساب برابر کریں',
                            style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  static Widget _buildDescriptionAndMediaBar({
    required TextEditingController noteCtrl,
    required bool hasPhoto,
    required bool hasAudio,
    required VoidCallback onTogglePhoto,
    required VoidCallback onToggleAudio,
  }) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: noteCtrl,
            style: const TextStyle(fontSize: 11.5),
            decoration: InputDecoration(
              hintText: 'تفصیلی ڈسکرپشن / نوٹ درج کریں...',
              hintStyle: const TextStyle(fontSize: 11),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ),
        const SizedBox(width: 6),
        InkWell(
          onTap: onTogglePhoto,
          child: Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: hasPhoto ? const Color(0xFFECFDF5) : const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: hasPhoto ? const Color(0xFFA7F3D0) : const Color(0xFFBFDBFE)),
            ),
            child: Icon(hasPhoto ? Icons.check_circle_rounded : Icons.camera_alt_rounded, size: 19, color: hasPhoto ? const Color(0xFF059669) : const Color(0xFF2563EB)),
          ),
        ),
        const SizedBox(width: 6),
        InkWell(
          onTap: onToggleAudio,
          child: Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: hasAudio ? const Color(0xFFECFDF5) : const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: hasAudio ? const Color(0xFFA7F3D0) : const Color(0xFFBFDBFE)),
            ),
            child: Icon(hasAudio ? Icons.check_circle_rounded : Icons.mic_rounded, size: 19, color: hasAudio ? const Color(0xFF059669) : const Color(0xFF059669)),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final int net = grandNetTotal;
    final bool isDebtor = net >= 0;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF1F5F9),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(64),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xFF1E293B), Color(0xFF334155)], begin: Alignment.centerLeft, end: Alignment.centerRight),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(color: Colors.white.withOpacity(0.12), borderRadius: BorderRadius.circular(8)),
                        child: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 16),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('میرا کھاتہ و گرینڈ لیجر', style: TextStyle(fontSize: 16.5, fontWeight: FontWeight.bold, color: Colors.white)),
                        Text('نایاب قسط پوائنٹ والیٹ', style: TextStyle(fontSize: 10.5, color: Color(0xFFCBD5E1))),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(color: const Color(0xFFFDE68A), borderRadius: BorderRadius.circular(6)),
                      child: Text('${customerProducts.length} فونز فعال', style: const TextStyle(fontSize: 10.5, color: Color(0xFF1E293B), fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // 1. ماسٹر نیٹ بینر
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [Color(0xFF0F172A), Color(0xFF1E293B)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [BoxShadow(color: Color(0x1A000000), blurRadius: 10, offset: Offset(0, 3))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          isDebtor ? 'کل خالص واجب الادا (آپ نے دینے ہیں):' : 'کل خالص کریڈٹ (دکان نے دینے ہیں):',
                          style: const TextStyle(fontSize: 12, color: Color(0xFFCBD5E1), fontWeight: FontWeight.bold),
                        ),
                        Text(
                          isDebtor ? 'آپ کے ذمہ واجب الادا' : 'دکان پر آپ کا کریڈٹ',
                          style: TextStyle(fontSize: 10, color: isDebtor ? const Color(0xFFFCA5A5) : const Color(0xFF86EFAC), fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Rs. ${net.abs()}',
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: isDebtor ? const Color(0xFFFDE68A) : const Color(0xFF4ADE80)),
                    ),
                    const SizedBox(height: 4),
                    const Text('اقساط اور نقد قرض میں سے صرف منظور شدہ خدمات و راشن خرچہ منہا ہوتا ہے', style: TextStyle(fontSize: 10.5, color: Color(0xFF94A3B8))),
                    const Divider(height: 18, color: Color(0xFF334155)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _summaryBlock('موبائل اقساط', 'Rs. $totalInstallmentDue', const Color(0xFF60A5FA)),
                        _summaryBlock('نقد دستی قرض', 'Rs. $cashLoanBalance', const Color(0xFFF87171)),
                        _summaryBlock('منظور شدہ ایڈجسٹمنٹ', '- Rs. $approvedServiceCredit', const Color(0xFF4ADE80)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // 2. تین واضح ٹیبز
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: const Color(0xFFCBD5E1))),
                child: Row(
                  children: [
                    _categoryTab(0, 'اقساط کھاتہ', 'Rs. ${(totalInstallmentDue / 1000).toStringAsFixed(1)}k'),
                    _categoryTab(1, 'نقد دستی ادھار', 'Rs. ${(cashLoanBalance / 1000).toStringAsFixed(0)}k'),
                    _categoryTab(2, 'خدمات و راشن ایڈجسٹمنٹ', '- Rs. ${(approvedServiceCredit / 1000).toStringAsFixed(1)}k'),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // 3. ٹیب مواد
              if (_selectedTabIndex == 0) ...[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: const Color(0xFFCBD5E1))),
                  child: Row(
                    children: [
                      const Icon(Icons.devices_other_rounded, size: 18, color: Color(0xFF2563EB)),
                      const SizedBox(width: 8),
                      const Text('موبائل منتخب کریں:', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 10),
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<int>(
                            value: _selectedProductIndex,
                            isExpanded: true,
                            style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                            items: List.generate(
                              customerProducts.length,
                              (i) => DropdownMenuItem(value: i, child: Text(customerProducts[i]['name'])),
                            ),
                            onChanged: (v) => setState(() => _selectedProductIndex = v!),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFCBD5E1))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(customerProducts[_selectedProductIndex]['plan'], style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
                            Text('ماہانہ قسط: Rs. ${customerProducts[_selectedProductIndex]['monthlyInstallment']}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF15803D))),
                          ],
                        ),
                      ),
                      const Divider(height: 1),
                      Table(
                        border: TableBorder.symmetric(inside: const BorderSide(color: Color(0xFFE2E8F0), width: 1)),
                        columnWidths: const {0: FlexColumnWidth(0.6), 1: FlexColumnWidth(1.4), 2: FlexColumnWidth(1.2), 3: FlexColumnWidth(1.1)},
                        children: [
                          const TableRow(
                            decoration: BoxDecoration(color: Color(0xFFF8FAFC)),
                            children: [
                              Padding(padding: EdgeInsets.all(6), child: Text('#', textAlign: TextAlign.center, style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold))),
                              Padding(padding: EdgeInsets.all(6), child: Text('تاریخ', textAlign: TextAlign.center, style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold))),
                              Padding(padding: EdgeInsets.all(6), child: Text('رقم', textAlign: TextAlign.center, style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold))),
                              Padding(padding: EdgeInsets.all(6), child: Text('عمل', textAlign: TextAlign.center, style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold))),
                            ],
                          ),
                          ...((customerProducts[_selectedProductIndex]['schedule'] as List).map((item) {
                            final bool isPaid = item['status'] == 'PAID';
                            final bool isDue = item['status'] == 'DUE';

                            return TableRow(
                              decoration: BoxDecoration(color: isDue ? const Color(0xFFEFF6FF) : Colors.transparent),
                              children: [
                                Padding(padding: const EdgeInsets.all(8), child: Text('${item['no']}', textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold))),
                                Padding(padding: const EdgeInsets.all(8), child: Text(item['date'], textAlign: TextAlign.center, style: const TextStyle(fontSize: 10.5))),
                                Padding(padding: const EdgeInsets.all(8), child: Text('Rs. ${item['amount']}', textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold))),
                                Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 4),
                                    decoration: BoxDecoration(
                                      color: isPaid ? const Color(0xFFDCFCE7) : isDue ? const Color(0xFF2563EB) : const Color(0xFFF1F5F9),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      isPaid ? '✔ ادا شدہ' : isDue ? 'پے کریں' : 'باقی',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: isPaid ? const Color(0xFF15803D) : isDue ? Colors.white : const Color(0xFF64748B)),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          })),
                        ],
                      ),
                    ],
                  ),
                ),
              ],

              // ٹیب 1: نقد دستی ادھار کھاتہ
              if (_selectedTabIndex == 1) ...[
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: const Color(0xFFCBD5E1))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('کل نقد دستی ادھار واجب الادا:', style: TextStyle(fontSize: 11.5, color: Color(0xFF64748B))),
                          Text('Rs. $cashLoanBalance', style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Color(0xFFDC2626))),
                        ],
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          _openPaymentModal(
                            title: 'نقد دستی ادھار کی واپسی',
                            baseAmount: cashLoanBalance,
                            isInstallment: false,
                            onComplete: (resolved, paid, discount, extra, splits, note, photo, audio) {
                              setState(() {
                                cashLoanBalance -= (paid + discount);
                                cashLoanEntries.insert(0, {
                                  'title': 'دستی قرض واپسی ادا کی (${splits.map((s) => s['source']).join(', ')})',
                                  'date': 'آج',
                                  'amount': paid,
                                  'type': 'CREDIT',
                                });
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('قرض واپسی جمع! رقم: Rs. $paid | رعایت: Rs. $discount'),
                                  backgroundColor: const Color(0xFF16A34A),
                                ),
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.payment_rounded, size: 14),
                        label: const Text('قرض واپس کریں', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1E293B), foregroundColor: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                ...cashLoanEntries.map((e) => Container(
                      margin: const EdgeInsets.only(bottom: 6),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFE2E8F0))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(e['title'], style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                              Text(e['date'], style: const TextStyle(fontSize: 10.5, color: Color(0xFF64748B))),
                            ],
                          ),
                          Text(
                            '${e['type'] == 'CREDIT' ? '-' : ''}Rs. ${e['amount']}',
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: e['type'] == 'CREDIT' ? const Color(0xFF16A34A) : const Color(0xFFDC2626)),
                          ),
                        ],
                      ),
                    )),
              ],

              // 🎯 ٹیب 2: خدمات و سامان ایڈجسٹمنٹ (مع تفصیلی ایکسپنس بریک ڈاؤن)
              if (_selectedTabIndex == 2) ...[
                InkWell(
                  onTap: _openMultiItemServiceSheet,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(color: const Color(0xFF1E293B), borderRadius: BorderRadius.circular(8)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_shopping_cart_rounded, color: Colors.white, size: 16),
                        SizedBox(width: 6),
                        Text('نئی خدمات، راشن یا اسٹاک تبادلہ درج کریں', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                ...serviceTransactions.map((item) {
                  final bool isStock = item['nature'] == 'STOCK';
                  final bool isExpanded = item['isExpanded'] ?? false;
                  final List itemsList = item['items'] as List;
                  final List expAllocations = (item['expenseAllocations'] as List?) ?? [];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFFCBD5E1)),
                    ),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              item['isExpanded'] = !isExpanded;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: isStock ? const Color(0xFFEFF6FF) : const Color(0xFFFEF3C7),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(isStock ? Icons.smartphone_rounded : Icons.receipt_long_rounded, size: 18, color: isStock ? const Color(0xFF1E40AF) : const Color(0xFF92400E)),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(item['title'], style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold)),
                                          const SizedBox(width: 6),
                                          _buildSyncStatusBadge(item['syncStatus']),
                                        ],
                                      ),
                                      const SizedBox(height: 2),
                                      Text('ٹارگٹ: ${item['target']} | ${item['date']} (${itemsList.length} اشیاء)', style: const TextStyle(fontSize: 10, color: Color(0xFF64748B))),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text('- Rs. ${item['totalAmount']}', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF16A34A))),
                                    const SizedBox(height: 2),
                                    Row(
                                      children: [
                                        if (item['hasAudio'] == true) const Icon(Icons.mic_rounded, size: 13, color: Color(0xFF059669)),
                                        if (item['hasPhoto'] == true) const Icon(Icons.image_outlined, size: 13, color: Color(0xFF2563EB)),
                                        Icon(isExpanded ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded, size: 18, color: const Color(0xFF64748B)),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        // تفصیلی ٹیبل اور ایکسپنس الاٹمنٹ
                        if (isExpanded) ...[
                          const Divider(height: 1, color: Color(0xFFE2E8F0)),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Color(0xFFF8FAFC),
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(isStock ? 'موبائل انوینٹری و اسپیسیفکیشن بل:' : 'تفصیلی اشیاء کی لسٹ (بل رسید):', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF334155))),
                                const SizedBox(height: 6),
                                Table(
                                  border: TableBorder.all(color: const Color(0xFFCBD5E1), width: 0.8),
                                  columnWidths: isStock
                                      ? const {0: FlexColumnWidth(1.6), 1: FlexColumnWidth(1.2), 2: FlexColumnWidth(1.0)}
                                      : const {0: FlexColumnWidth(0.5), 1: FlexColumnWidth(2.0), 2: FlexColumnWidth(1.0)},
                                  children: [
                                    TableRow(
                                      decoration: const BoxDecoration(color: Color(0xFFE2E8F0)),
                                      children: [
                                        Padding(padding: const EdgeInsets.all(5), child: Text(isStock ? 'موبائل ماڈل و IMEI' : '#', textAlign: TextAlign.center, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold))),
                                        Padding(padding: const EdgeInsets.all(5), child: Text(isStock ? 'تفصیل و وارنٹی' : 'سامان کا نام', textAlign: TextAlign.center, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold))),
                                        const Padding(padding: EdgeInsets.all(5), child: Text('رقم (Rs)', textAlign: TextAlign.center, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold))),
                                      ],
                                    ),
                                    ...itemsList.asMap().entries.map((e) {
                                      int itmIdx = e.key;
                                      var itm = e.value;

                                      if (isStock) {
                                        return TableRow(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(6),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(itm['name'], style: const TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold)),
                                                  Text('IMEI: ${itm['imei'] ?? "نہیں"}', style: const TextStyle(fontSize: 9, color: Color(0xFF64748B))),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(6),
                                              child: Text('${itm['ramRom']}\n${itm['condition']}\n${itm['warranty']}', style: const TextStyle(fontSize: 9.5)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(6),
                                              child: Text('Rs. ${itm['amount']}', textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF15803D))),
                                            ),
                                          ],
                                        );
                                      } else {
                                        return TableRow(
                                          children: [
                                            Padding(padding: const EdgeInsets.all(6), child: Text('${itmIdx + 1}', textAlign: TextAlign.center, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold))),
                                            Padding(padding: const EdgeInsets.all(6), child: Text(itm['name'], style: const TextStyle(fontSize: 10.5, fontWeight: FontWeight.w600))),
                                            Padding(padding: const EdgeInsets.all(6), child: Text('Rs. ${itm['amount']}', textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF15803D))),
                                            ),
                                          ],
                                        );
                                      }
                                    }),
                                  ],
                                ),

                                // 🎯 ایکسپنس الاٹمنٹ ڈسپلے (اگر گروسری ہو)
                                if (!isStock && expAllocations.isNotEmpty) ...[
                                  const SizedBox(height: 8),
                                  Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6), border: Border.all(color: const Color(0xFFE2E8F0))),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text('پرافٹ اینڈ لاس میں درج خرچہ ہیڈز:', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF475569))),
                                        const SizedBox(height: 2),
                                        ...expAllocations.map((al) => Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 1.5),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text('• ${al['category']}', style: const TextStyle(fontSize: 9.5, color: Color(0xFF334155))),
                                                  Text('Rs. ${al['amount']}', style: const TextStyle(fontSize: 9.5, fontWeight: FontWeight.bold, color: Color(0xFF92400E))),
                                                ],
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ],

                                const SizedBox(height: 6),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item['syncStatus'] == 'ADMIN_APPROVED' ? 'حالت: منظور شدہ (کھاتے میں منفی شدہ)' : 'حالت: پینڈنگ تصدیق (ابھی کٹوتی نہیں ہوئی)',
                                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: item['syncStatus'] == 'ADMIN_APPROVED' ? const Color(0xFF15803D) : const Color(0xFFB45309)),
                                    ),
                                    Text('کل کٹوتی بل: Rs. ${item['totalAmount']}', style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  );
                }),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryTab(int index, String title, String badge) {
    final bool isSel = _selectedTabIndex == index;
    return Expanded(
      child: InkWell(
        onTap: () => setState(() => _selectedTabIndex = index),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: isSel ? const Color(0xFF1E293B) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: isSel ? Colors.white : const Color(0xFF334155))),
              const SizedBox(height: 2),
              Text(badge, style: TextStyle(fontSize: 9.5, fontWeight: FontWeight.w600, color: isSel ? const Color(0xFFFDE68A) : const Color(0xFF64748B))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _summaryBlock(String title, String val, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 9.5, color: Color(0xFF94A3B8))),
        const SizedBox(height: 2),
        Text(val, style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, color: color)),
      ],
    );
  }
}