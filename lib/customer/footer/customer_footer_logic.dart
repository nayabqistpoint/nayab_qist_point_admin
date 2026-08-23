import 'package:flutter/material.dart';
import 'package:my_first_app/shared/installment_calculator_page.dart';
import 'package:my_first_app/customer/signup_page.dart';

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