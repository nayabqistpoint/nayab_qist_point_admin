import 'package:flutter/material.dart';

// چاروں ماڈیولز کے امپورٹس
import 'package:nayab_qist_point_admin/pending_requests/signup_requests/signup_requests.dart';
import 'package:nayab_qist_point_admin/pending_requests/installment_payment_requests/installment_payment_requests.dart';
import 'package:nayab_qist_point_admin/pending_requests/pin_login_requests/pin_login_requests.dart';
import 'package:nayab_qist_point_admin/pending_requests/new_order_requests/new_order_requests.dart';

class AdminActionCenterLogic {
  // 1. سائن اپ
  static void openSignupRequests(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignupRequests()),
    );
  }

  // 2. قسط کی ادائیگی
  static void openInstallmentPaymentRequests(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const InstallmentPaymentRequests()),
    );
  }

  // 3. PIN / لاگ ان
  static void openPinLoginRequests(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PinLoginRequests()),
    );
  }

  // 4. نیا آرڈر
  static void openNewOrderRequests(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NewOrderRequests()),
    );
  }
}