import 'package:flutter/material.dart';
import 'package:nayab_qist_point_admin/home/admin_action_center/admin_action_center_logic.dart';

class AdminActionCenterUi extends StatelessWidget {
  const AdminActionCenterUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🎯 1. نئی خریداری کیپسول بٹن
        Padding(
          padding: const EdgeInsets.only(left: 14, right: 14, bottom: 8),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.12), blurRadius: 6, offset: const Offset(0, 2))],
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add_rounded, color: Colors.white, size: 16),
                  SizedBox(width: 4),
                  Icon(Icons.shopping_cart_checkout_rounded, color: Colors.white, size: 15),
                  SizedBox(width: 6),
                  Text('نئی خریداری', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ),

        // 🎯 2. چاروں ایکٹو بیجز کارڈ
        Container(
          margin: const EdgeInsets.only(left: 14, right: 14, bottom: 10),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width - 44),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _badge(Icons.person_add_rounded, 'سائن اپ', 3, Colors.blue.shade700, () => AdminActionCenterLogic.openSignupRequests(context)),
                  _badge(Icons.vpn_key_rounded, 'PIN / لاگ ان', 1, Colors.orange.shade800, () => AdminActionCenterLogic.openPinLoginRequests(context)),
                  _badge(Icons.receipt_long_rounded, 'قسط کی ادائیگی', 5, Colors.teal, () => AdminActionCenterLogic.openInstallmentPaymentRequests(context)),
                  _badge(Icons.shopping_bag_rounded, 'نیا آرڈر', 2, Colors.purple, () => AdminActionCenterLogic.openNewOrderRequests(context)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // 🎯 بیج ہیلپر (صاف اور مختصر)
  Widget _badge(IconData icon, String label, int count, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 6, offset: const Offset(0, 2))],
                  ),
                  child: Icon(icon, color: color, size: 26),
                ),
                if (count > 0)
                  Positioned(
                    top: -4,
                    right: -4,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(color: const Color(0xFFDC2626), shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2)),
                      constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
                      child: Text('$count', style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 6),
            Text(label, style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, color: Color(0xFF334155))),
          ],
        ),
      ),
    );
  }
}