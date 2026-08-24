import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_first_app/admin/admin_panel/admin_panel_controller.dart';
import 'package:my_first_app/admin/admin_panel/request_card_item.dart';

class PendingView extends StatelessWidget {
  final AdminPanelController controller;
  final VoidCallback onStateChanged;

  const PendingView({
    super.key,
    required this.controller,
    required this.onStateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('signupRequests').snapshots(),
      builder: (context, snapshot) {
        List<Map<String, dynamic>> pendingList = [];

        if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
          for (var doc in snapshot.data!.docs) {
            final Map<String, dynamic> firestoreData = Map<String, dynamic>.from(doc.data() as Map);
            
            final Map<String, dynamic> customerData = Map<String, dynamic>.from(firestoreData['customerData'] ?? {});
            final Map<String, dynamic> packageData = Map<String, dynamic>.from(firestoreData['packageData'] ?? {});
            final Map<String, dynamic> guarantorData = Map<String, dynamic>.from(firestoreData['guarantorData'] ?? {});

            final String phone = firestoreData['phone'] ?? customerData['customerPhone'] ?? doc.id;
            
            // اسٹیٹس کو ہر جگہ سے تسلی کے ساتھ پڑھنا
            final String rawStatus = (firestoreData['status'] ?? packageData['status'] ?? customerData['status'] ?? 'Pending').toString().trim().toLowerCase();

            // پرچیز کی درست فلٹرنگ
            bool isPurchase = (packageData['isPurchaseRequested'] == true) || 
                               (firestoreData['isPurchaseRequested'] == true) || 
                               (packageData.containsKey('packageName') && packageData['packageName'] != null);

            // صرف 'pending' اسٹیٹس والے کارڈز ہی یہاں دکھائیں
            if (rawStatus == 'pending') {
              pendingList.add({
                'customerPhone': phone,
                'phone': phone,
                ...customerData,
                ...packageData,
                'customerData': customerData,
                'packageData': packageData,
                'guarantorData': guarantorData,
                'isPurchaseRequested': isPurchase,
                'status': 'Pending',
              });
            }
          }
        } 

        if (pendingList.isEmpty && Hive.isBoxOpen('packageBox')) {
          final box = Hive.box('packageBox');
          for (var item in box.values) {
            if (item is Map) {
              final Map<String, dynamic> data = Map<String, dynamic>.from(item);
              final String status = (data['status'] ?? 'Pending').toString().trim().toLowerCase();
              if (status == 'pending') {
                pendingList.add(data);
              }
            }
          }
        }

        if (pendingList.isEmpty) {
          return const Center(
            child: Text(
              "کوئی پینڈنگ ریکویسٹ موجود نہیں ہے",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: pendingList.length,
          itemBuilder: (context, index) {
            return RequestCardItem(
              requestData: pendingList[index],
              request: pendingList[index],
              controller: controller,
              isApprovedView: false,
              isCompletedView: false,
              onStateChanged: onStateChanged,
            );
          },
        );
      },
    );
  }
}