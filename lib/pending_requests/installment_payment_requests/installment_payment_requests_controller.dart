import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InstallmentPaymentRequestsController {
  final VoidCallback onUpdate;

  InstallmentPaymentRequestsController({required this.onUpdate});

  // فرضی ڈیٹا (بعد میں ڈیٹا بیس یا API کے ساتھ منسلک ہو جائے گا)
  final List<Map<String, dynamic>> paymentRequests = [
    {
      'id': '1',
      'name': 'محمد بلال',
      'caste': 'آرائیں',
      'phone': '03009876543',
      'item': 'Infinix Note 40 Pro (موبائل)',
      'currentInstallmentNo': 4,
      'totalInstallments': 12,
      'month': 'ستمبر 2026',
      'installmentAmount': 'Rs. 4,500',
      'shortAmount': 'Rs. 0 (مکمل کلین)',
      'isShort': false,
      'paymentMethod': 'JazzCash (جاز کیش)',
      'trxId': 'TRX-9988231',
      'date': '12 ستمبر 2026',
      'hasAudioNote': true,
      'audioDuration': '0:38',
      'schedule': [
        {'no': 1, 'month': 'جون 2026', 'amount': 'Rs. 4,500', 'status': 'PAID'},
        {'no': 2, 'month': 'جولائی 2026', 'amount': 'Rs. 4,500', 'status': 'PAID'},
        {'no': 3, 'month': 'اگست 2026', 'amount': 'Rs. 4,500', 'status': 'PAID'},
        {'no': 4, 'month': 'ستمبر 2026', 'amount': 'Rs. 4,500', 'status': 'CURRENT'},
        {'no': 5, 'month': 'اکتوبر 2026', 'amount': 'Rs. 4,500', 'status': 'PENDING'},
        {'no': 6, 'month': 'نومبر 2026', 'amount': 'Rs. 4,500', 'status': 'PENDING'},
        {'no': 7, 'month': 'دسمبر 2026', 'amount': 'Rs. 4,500', 'status': 'PENDING'},
        {'no': 8, 'month': 'جنوری 2027', 'amount': 'Rs. 4,500', 'status': 'PENDING'},
        {'no': 9, 'month': 'فروری 2027', 'amount': 'Rs. 4,500', 'status': 'PENDING'},
        {'no': 10, 'month': 'مارچ 2027', 'amount': 'Rs. 4,500', 'status': 'PENDING'},
        {'no': 11, 'month': 'اپریل 2027', 'amount': 'Rs. 4,500', 'status': 'PENDING'},
        {'no': 12, 'month': 'مئی 2027', 'amount': 'Rs. 4,500', 'status': 'PENDING'},
      ],
    },
    {
      'id': '2',
      'name': 'طاہر محمود',
      'caste': 'راجپوت',
      'phone': '03017654321',
      'item': 'Haier 32" Smart LED TV',
      'currentInstallmentNo': 6,
      'totalInstallments': 10,
      'month': 'ستمبر 2026',
      'installmentAmount': 'Rs. 7,000',
      'shortAmount': 'Rs. 3,500 (سابقہ شارٹ بقایا)',
      'isShort': true,
      'paymentMethod': 'EasyPaisa (ایزی پیسہ)',
      'trxId': 'EP-4412098',
      'date': '12 ستمبر 2026',
      'hasAudioNote': true,
      'audioDuration': '0:45',
      'schedule': [
        {'no': 1, 'month': 'اپریل 2026', 'amount': 'Rs. 7,000', 'status': 'PAID'},
        {'no': 2, 'month': 'مئی 2026', 'amount': 'Rs. 7,000', 'status': 'PAID'},
        {'no': 3, 'month': 'جون 2026', 'amount': 'Rs. 7,000', 'status': 'PAID'},
        {'no': 4, 'month': 'جولائی 2026', 'amount': 'Rs. 7,000', 'status': 'PAID'},
        {'no': 5, 'month': 'اگست 2026', 'amount': 'Rs. 3,500', 'status': 'DEFAULT'},
        {'no': 6, 'month': 'ستمبر 2026', 'amount': 'Rs. 7,000', 'status': 'CURRENT'},
        {'no': 7, 'month': 'اکتوبر 2026', 'amount': 'Rs. 7,000', 'status': 'PENDING'},
        {'no': 8, 'month': 'نومبر 2026', 'amount': 'Rs. 7,000', 'status': 'PENDING'},
        {'no': 9, 'month': 'دسمبر 2026', 'amount': 'Rs. 7,000', 'status': 'PENDING'},
        {'no': 10, 'month': 'جنوری 2027', 'amount': 'Rs. 7,000', 'status': 'PENDING'},
      ],
    },
  ];

  // تمام اسٹیٹس
  final Map<int, bool> expandedState = {};
  final Map<int, bool> showSchedule = {};
  final Map<int, bool> showReceipt = {};
  final Map<int, bool> isPlayingAudio = {};
  final Map<int, double> audioProgress = {};

  // کارڈ پھیلانے / سمیٹنے کا ٹاگل
  void toggleExpand(int index) {
    expandedState[index] = !(expandedState[index] ?? false);
    onUpdate();
  }

  // شیڈول ٹیبل ٹاگل
  void toggleSchedule(int index) {
    showSchedule[index] = !(showSchedule[index] ?? false);
    onUpdate();
  }

  // رسید سلپ ٹاگل
  void toggleReceipt(int index) {
    showReceipt[index] = !(showReceipt[index] ?? false);
    onUpdate();
  }

  // آڈیو پلے / پاز ٹاگل
  void toggleAudioPlay(int index) {
    isPlayingAudio[index] = !(isPlayingAudio[index] ?? false);
    onUpdate();
  }

  // آڈیو پروگریس سلائیڈر
  void updateAudioProgress(int index, double val) {
    audioProgress[index] = val;
    onUpdate();
  }

  // فون کال لاجک
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

  // تصدیق لاجک
  void approvePayment(BuildContext context, int index) {
    final name = paymentRequests[index]['name'];
    final amt = paymentRequests[index]['installmentAmount'];

    paymentRequests.removeAt(index);
    expandedState.remove(index);
    showSchedule.remove(index);
    showReceipt.remove(index);
    isPlayingAudio.remove(index);
    audioProgress.remove(index);
    onUpdate();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$name کی $amt قسط کی تصدیق ہو گئی!'),
        backgroundColor: const Color(0xFF16A34A),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // تردید لاجک
  void rejectPayment(BuildContext context, int index) {
    final name = paymentRequests[index]['name'];

    paymentRequests.removeAt(index);
    expandedState.remove(index);
    showSchedule.remove(index);
    showReceipt.remove(index);
    isPlayingAudio.remove(index);
    audioProgress.remove(index);
    onUpdate();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$name کی قسط کی تردید کر دی گئی!'),
        backgroundColor: const Color(0xFFDC2626),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}