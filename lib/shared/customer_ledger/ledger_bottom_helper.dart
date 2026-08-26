import 'package:flutter/material.dart';
import 'package:nayab_qist_point_admin/shared/customer_ledger/customer_ledger_controller.dart';
import 'package:nayab_qist_point_admin/admin/home_page/transaction_forms/payment_in/payment_in_screen.dart';
import 'package:nayab_qist_point_admin/admin/home_page/transaction_forms/payment_out/payment_out_screen.dart';
import 'package:nayab_qist_point_admin/customer/pay_now/pay_now_widget.dart';
import 'package:nayab_qist_point_admin/customer/purchase_now/purchase_now.dart';

class LedgerBottomHelper {
  static Future<void> handleLeftButton(BuildContext context, CustomerLedgerController controller) =>
      _navigateAndReload(
        context,
        controller,
        controller.isAdmin
            ? PaymentOutScreen(customerId: controller.customerPhone)
            : PurchaseNow(customerMobileNumber: controller.customerPhone),
      );

  static Future<void> handleRightButton(BuildContext context, CustomerLedgerController controller) =>
      _navigateAndReload(
        context,
        controller,
        controller.isAdmin
            ? PaymentInScreen(customerId: controller.customerPhone)
            : PayNowWidget(customerMobileNumber: controller.customerPhone),
      );

  static Future<void> _navigateAndReload(
    BuildContext context,
    CustomerLedgerController controller,
    Widget targetScreen,
  ) async {
    await Navigator.push(context, MaterialPageRoute(builder: (_) => targetScreen));
    controller.loadCustomerTransactions();
  }
}