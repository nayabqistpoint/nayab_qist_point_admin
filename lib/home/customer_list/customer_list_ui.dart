import 'package:flutter/material.dart';
import 'package:nayab_qist_point_admin/home/customer_list/customer_list_logic.dart';

class CustomerListUI extends StatelessWidget {
  const CustomerListUI({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = CustomerListLogic();

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: logic.customers.length,
      itemBuilder: (context, index) {
        final customer = logic.customers[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8.0),
          child: ListTile(
            title: Text(customer.name, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(customer.status, style: const TextStyle(color: Colors.red, fontSize: 12)),
            trailing: Text(
              customer.amount,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        );
      },
    );
  }
}