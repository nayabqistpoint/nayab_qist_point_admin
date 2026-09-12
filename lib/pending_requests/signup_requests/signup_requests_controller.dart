import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SignupRequestsController {
  // کسٹمرز کا ڈیٹا
  List<Map<String, String>> requests = [
    {
      'id': '1',
      'name': 'محمد عثمان',
      'caste': 'آرائیں',
      'fatherName': 'عبدالرحمٰن',
      'phone': '03001234567',
      'cnic': '31202-1234567-1',
      'address': 'محلہ ماڈل ٹاؤن، حاصل پور',
      'guarantorName': 'علی احمد',
      'guarantorRelation': 'سگا بھائی',
      'guarantorCaste': 'آرائیں',
      'guarantorPhone': '03019876543',
      'guarantorCnic': '31202-9876543-1',
      'date': '11 ستمبر 2026',
    },
    {
      'id': '2',
      'name': 'احمد رضا',
      'caste': 'راجپوت',
      'fatherName': 'محمد بلال',
      'phone': '03027654321',
      'cnic': '31202-7654321-3',
      'address': 'مین بازار، قائم پور',
      'guarantorName': 'حمزہ طارق',
      'guarantorRelation': 'چچا زاد',
      'guarantorCaste': 'راجپوت',
      'guarantorPhone': '03031122334',
      'guarantorCnic': '31202-1122334-5',
      'date': '11 ستمبر 2026',
    },
  ];

  final Map<int, bool> expandedState = {};
  final Map<int, bool> showDocs = {};
  final Map<int, bool> showGuarantor = {};

  // فون کال
  Future<void> makePhoneCall(BuildContext context, String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('کال نہیں ملائی جا سکی: $phoneNumber'),
            backgroundColor: const Color(0xFFDC2626),
          ),
        );
      }
    }
  }

  // تصدیق
  void approveRequest(BuildContext context, int index, VoidCallback updateUi) {
    final customerName = requests[index]['name'];
    requests.removeAt(index);
    expandedState.remove(index);
    showDocs.remove(index);
    showGuarantor.remove(index);
    updateUi();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$customerName کی درخواست کی تصدیق ہو گئی!'),
        backgroundColor: const Color(0xFF16A34A),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // تردید
  void rejectRequest(BuildContext context, int index, VoidCallback updateUi) {
    final customerName = requests[index]['name'];
    requests.removeAt(index);
    expandedState.remove(index);
    showDocs.remove(index);
    showGuarantor.remove(index);
    updateUi();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$customerName کی درخواست کی تردید کر دی گئی!'),
        backgroundColor: const Color(0xFFDC2626),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void toggleExpand(int index, VoidCallback updateUi) {
    expandedState[index] = !(expandedState[index] ?? false);
    updateUi();
  }

  void toggleDocs(int index, VoidCallback updateUi) {
    showDocs[index] = !(showDocs[index] ?? false);
    updateUi();
  }

  void toggleGuarantor(int index, VoidCallback updateUi) {
    showGuarantor[index] = !(showGuarantor[index] ?? false);
    updateUi();
  }
}