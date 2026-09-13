import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewOrderRequestsController {
  final VoidCallback onUpdate;

  NewOrderRequestsController({required this.onUpdate});

  int? expandedOrderIndex;
  final Map<String, bool> subSections = {};
  final Map<int, TextEditingController> priceControllers = {};
  final Map<int, TextEditingController> handoverNotes = {};

  final List<Map<String, dynamic>> orders = [
    {
      'id': 'ORD-101',
      'customerName': 'محمد بلال',
      'caste': 'آرائیں',
      'customerPhone': '03009876543',
      'customerAddress': 'محلہ نور شاہ، قائم پور',
      'guarantorName': 'محمد یوسف',
      'guarantorRelation': 'والد',
      'guarantorPhone': '03007654321',
      'productName': 'Vivo Y21 (4/64)',
      'isPurchasedByStock': true,
      'imei': '864209041234567',
      'cashPrice': 38000,
      'totalInstallmentPrice': 47500,
      'adminProfit': 9500,
      'planMonths': 8,
      'advance': 5000,
      'monthlyInstallment': 5312,
      'date': '13 ستمبر 2026',
      'hasAudio': true,
      'audioDuration': '0:42',
      'stampUploaded': true,
      'cnicCopied': true,
      'docsSigned': true,
      'advanceReceived': true,
      'boxRetainedInShop': true,
      'stampPaperReceived': true,
      'chequeReceived': false,
      'photoTaken': true,
      'schedule': [
        {'no': 1, 'date': '05 اکتوبر 2026', 'amount': 'Rs. 2,656', 'type': 'ہاف قسط (گریس ایڈجسٹ)', 'status': 'بقایا'},
        {'no': 2, 'date': '05 نومبر 2026', 'amount': 'Rs. 5,692', 'type': 'مکمل قسط', 'status': 'بقایا'},
        {'no': 3, 'date': '05 دسمبر 2026', 'amount': 'Rs. 5,692', 'type': 'مکمل قسط', 'status': 'بقایا'},
        {'no': 4, 'date': '05 جنوری 2027', 'amount': 'Rs. 5,692', 'type': 'مکمل قسط', 'status': 'بقایا'},
        {'no': 5, 'date': '05 فروری 2027', 'amount': 'Rs. 5,692', 'type': 'مکمل قسط', 'status': 'بقایا'},
        {'no': 6, 'date': '05 مارچ 2027', 'amount': 'Rs. 5,692', 'type': 'مکمل قسط', 'status': 'بقایا'},
        {'no': 7, 'date': '05 اپریل 2027', 'amount': 'Rs. 5,692', 'type': 'مکمل قسط', 'status': 'بقایا'},
        {'no': 8, 'date': '05 مئی 2027', 'amount': 'Rs. 5,692', 'type': 'مکمل قسط', 'status': 'بقایا'},
      ],
    },
    {
      'id': 'ORD-102',
      'customerName': 'عمران ریاض',
      'caste': 'جٹ',
      'customerPhone': '03087654321',
      'customerAddress': 'چک 45 حاصل پور روڈ، قائم پور',
      'guarantorName': 'محمد اسلم',
      'guarantorRelation': 'بھائی',
      'guarantorPhone': '03012349876',
      'productName': 'Infinix Note 40 Pro',
      'isPurchasedByStock': false,
      'imei': null,
      'customerQuotedPrice': 52000,
      'totalInstallmentPrice': 75600,
      'adminProfit': 19600,
      'planMonths': 10,
      'advance': 0,
      'monthlyInstallment': 7560,
      'date': '13 ستمبر 2026',
      'hasAudio': true,
      'audioDuration': '0:28',
      'stampUploaded': false,
      'cnicCopied': false,
      'docsSigned': false,
      'advanceReceived': false,
      'boxRetainedInShop': false,
      'stampPaperReceived': false,
      'chequeReceived': false,
      'photoTaken': false,
      'schedule': [
        {'no': 1, 'date': '05 اکتوبر 2026', 'amount': 'Rs. 7,560', 'type': 'قسط 1 (زیرو ایڈوانس)', 'status': 'بقایا'},
        {'no': 2, 'date': '05 نومبر 2026', 'amount': 'Rs. 7,560', 'type': 'مکمل قسط', 'status': 'بقایا'},
        {'no': 3, 'date': '05 دسمبر 2026', 'amount': 'Rs. 7,560', 'type': 'مکمل قسط', 'status': 'بقایا'},
        {'no': 4, 'date': '05 جنوری 2027', 'amount': 'Rs. 7,560', 'type': 'مکمل قسط', 'status': 'بقایا'},
        {'no': 5, 'date': '05 فروری 2027', 'amount': 'Rs. 7,560', 'type': 'مکمل قسط', 'status': 'بقایا'},
        {'no': 6, 'date': '05 مارچ 2027', 'amount': 'Rs. 7,560', 'type': 'مکمل قسط', 'status': 'بقایا'},
        {'no': 7, 'date': '05 اپریل 2027', 'amount': 'Rs. 7,560', 'type': 'مکمل قسط', 'status': 'بقایا'},
        {'no': 8, 'date': '05 مئی 2027', 'amount': 'Rs. 7,560', 'type': 'مکمل قسط', 'status': 'بقایا'},
        {'no': 9, 'date': '05 جون 2027', 'amount': 'Rs. 7,560', 'type': 'مکمل قسط', 'status': 'بقایا'},
        {'no': 10, 'date': '05 جولائی 2027', 'amount': 'Rs. 7,560', 'type': 'مکمل قسط', 'status': 'بقایا'},
      ],
    },
  ];

  void initControllers() {
    for (int i = 0; i < orders.length; i++) {
      priceControllers[i] = TextEditingController();
      handoverNotes[i] = TextEditingController();
    }
  }

  void dispose() {
    for (var c in priceControllers.values) {
      c.dispose();
    }
    for (var c in handoverNotes.values) {
      c.dispose();
    }
  }

  void toggleOrderExpand(int index) {
    expandedOrderIndex = (expandedOrderIndex == index) ? null : index;
    onUpdate();
  }

  bool isSubOpen(String key) => subSections[key] ?? false;

  void toggleSub(String key) {
    subSections[key] = !(subSections[key] ?? false);
    onUpdate();
  }

  void updateChecklist(int index, String key, bool value) {
    orders[index][key] = value;
    onUpdate();
  }

  Future<void> makePhoneCall(BuildContext context, String phone) async {
    final Uri uri = Uri(scheme: 'tel', path: phone);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('کال نہیں ملائی جا سکی: $phone'), backgroundColor: const Color(0xFFDC2626)),
        );
      }
    }
  }

  Future<void> sendWhatsAppCounterPrice(String phone, String item, int quoted, String actual) async {
    final cleanPrice = actual.trim().isEmpty ? 'مارکیٹ ریٹ' : 'Rs. $actual';
    final String msg = 'محترم کسٹمر! نایاب قسط پوائنٹ پر آپ نے $item کی قیمت Rs. $quoted درج کی ہے، جبکہ موجودہ مارکیٹ قیمت $cleanPrice ہے۔ برائے مہربانی درست ریٹ کے ساتھ دوبارہ پرچیز آرڈر درج کریں۔ شکریہ!';
    final Uri uri = Uri.parse('https://wa.me/92${phone.substring(1)}?text=${Uri.encodeComponent(msg)}');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void approveOrder(BuildContext context, int index) {
    final String name = orders[index]['customerName'];
    orders.removeAt(index);
    expandedOrderIndex = null;
    onUpdate();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$name کا آرڈر منظور! نیا کھاتہ فعال ہو گیا۔'),
        backgroundColor: const Color(0xFF16A34A),
      ),
    );
  }

  void rejectOrder(BuildContext context, int index) {
    final String name = orders[index]['customerName'];
    orders.removeAt(index);
    expandedOrderIndex = null;
    onUpdate();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$name کا آرڈر مسترد کر دیا گیا۔'),
        backgroundColor: const Color(0xFFDC2626),
      ),
    );
  }
}