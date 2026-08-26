import 'package:flutter/material.dart';
import 'package:nayab_qist_point_admin/shared/installment_calculator_page.dart';
import 'package:nayab_qist_point_admin/customer/signup_page.dart';

class CustomerFooterLogic {
  // 🎯 نیا اکاؤنٹ (سائن اپ) پیج پر جانے کی لاجک
  void handleSignUpNavigation(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignupPage(),
      ),
    );
  }

  // 🎯 آن لائن قسط کیلکولیٹر پیج پر جانے کی لاجک
  void handleCalculatorNavigation(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const InstallmentCalculaterPage(),
      ),
    );
  }
}