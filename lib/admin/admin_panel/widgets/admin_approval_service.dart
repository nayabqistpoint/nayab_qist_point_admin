import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminApprovalService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> approveSignupRequest({
    required String phone,
    required String status, // 'Approved' یا 'Completed'
    required Map<String, dynamic> requestData,
  }) async {
    final String cleanPhone = phone.trim();
    final String pass = cleanPhone.length >= 4 ? cleanPhone.substring(cleanPhone.length - 4) : '1234';

    try {
      final docRef = _firestore.collection('signupRequests').doc(cleanPhone);
      final docSnapshot = await docRef.get();
      final data = docSnapshot.exists ? (docSnapshot.data() ?? {}) : requestData;

      // ۱. لوکل ہائیو باکسز میں ڈیٹا منتقل کرنا
      final Map<String, dynamic> cData = Map<String, dynamic>.from(data['customerData'] ?? requestData);
      final Map<String, dynamic> pData = Map<String, dynamic>.from(data['packageData'] ?? requestData);
      final Map<String, dynamic> gData = Map<String, dynamic>.from(data['guarantorData'] ?? {});

      cData['status'] = status;
      pData['status'] = status;

      if (Hive.isBoxOpen('customerBox')) await Hive.box('customerBox').put(cleanPhone, cData);
      if (Hive.isBoxOpen('packageBox')) await Hive.box('packageBox').put(cleanPhone, pData);
      if (gData.isNotEmpty && Hive.isBoxOpen('guarantorBox')) await Hive.box('guarantorBox').put(cleanPhone, gData);

      // ۲. فائربیس پر اسٹیٹس ہینڈل کرنا
      if (status == 'Approved') {
        // نیسٹڈ اور روٹ دونوں جگہوں پر اسٹیٹس یکساں Approved کرنا
        await docRef.set({
          'status': 'Approved',
          'packageData': {...pData, 'status': 'Approved'},
          'customerData': {...cData, 'status': 'Approved'},
        }, SetOptions(merge: true));
        debugPrint('Signup request marked as Approved.');
      } else if (status == 'Completed') {
        // فائنل منظوری پر یوزر کریٹ کریں اور signupRequests سے ڈیلیٹ کریں
        final Map<String, dynamic> userData = {'phone': cleanPhone, 'pin': pass, 'isAdmin': false};
        if (Hive.isBoxOpen('usersBox')) await Hive.box('usersBox').put(cleanPhone, userData);
        await _firestore.collection('usersBox').doc(cleanPhone).set(userData);

        await docRef.delete();
        debugPrint('Signup request completed and flushed.');
      }
    } catch (e) {
      debugPrint('Admin Approval Sync Error: $e');
    }
  }

  Future<void> rejectSignupRequest(String phone) async {
    final String cleanPhone = phone.trim();
    try {
      if (Hive.isBoxOpen('packageBox')) Hive.box('packageBox').delete(cleanPhone);
      if (Hive.isBoxOpen('customerBox')) Hive.box('customerBox').delete(cleanPhone);
      await _firestore.collection('signupRequests').doc(cleanPhone).delete();
    } catch (e) {
      debugPrint('Firestore Reject Error: $e');
    }
  }
}