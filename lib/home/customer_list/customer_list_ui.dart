import 'package:flutter/material.dart';

class CustomerListUi extends StatelessWidget {
  const CustomerListUi({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue.shade50,
                    child: const Text('م', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('محمد افضل', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                      SizedBox(height: 2),
                      Text('0300-1234567', style: TextStyle(fontSize: 10, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Rs. 35,000', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.red)),
                  SizedBox(height: 2),
                  Text('باقی قسط', style: TextStyle(fontSize: 9, color: Colors.red)),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}