import 'package:flutter/material.dart';

import 'package:nayab_qist_point_admin/pending_requests/new_order_requests/new_order_requests_controller.dart';
import 'package:nayab_qist_point_admin/pending_requests/new_order_requests/new_order_requests_ui_components/new_order_app_bar_ui.dart';
import 'package:nayab_qist_point_admin/pending_requests/new_order_requests/new_order_requests_ui_components/new_order_ribbon_ui.dart';
import 'package:nayab_qist_point_admin/pending_requests/new_order_requests/new_order_requests_ui_components/new_order_header_tile_ui.dart';
import 'package:nayab_qist_point_admin/pending_requests/new_order_requests/new_order_requests_ui_components/new_order_stock_alert_ui.dart';
import 'package:nayab_qist_point_admin/pending_requests/new_order_requests/new_order_requests_ui_components/new_order_profit_banner_ui.dart';
import 'package:nayab_qist_point_admin/pending_requests/new_order_requests/new_order_requests_ui_components/new_order_customer_details_ui.dart';
import 'package:nayab_qist_point_admin/pending_requests/new_order_requests/new_order_requests_ui_components/new_order_guarantor_details_ui.dart';
import 'package:nayab_qist_point_admin/pending_requests/new_order_requests/new_order_requests_ui_components/new_order_schedule_table_ui.dart';
import 'package:nayab_qist_point_admin/pending_requests/new_order_requests/new_order_requests_ui_components/new_order_audio_player_ui.dart';
import 'package:nayab_qist_point_admin/pending_requests/new_order_requests/new_order_requests_ui_components/new_order_legal_docs_ui.dart';
import 'package:nayab_qist_point_admin/pending_requests/new_order_requests/new_order_requests_ui_components/new_order_handover_checklist_ui.dart';
import 'package:nayab_qist_point_admin/pending_requests/new_order_requests/new_order_requests_ui_components/new_order_action_buttons_ui.dart';

class NewOrderRequests extends StatefulWidget {
  const NewOrderRequests({super.key});

  @override
  State<NewOrderRequests> createState() => _NewOrderRequestsState();
}

class _NewOrderRequestsState extends State<NewOrderRequests> {
  // براہ راست انیشلائزیشن تاکہ ہاٹ ری لوڈ پر LateInitializationError نہ آئے
  NewOrderRequestsController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = NewOrderRequestsController(
      onUpdate: () {
        if (mounted) setState(() {});
      },
    );
    _controller!.initControllers();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final controller = _controller!;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF1F5F9),
        appBar: NewOrderAppBarUi(count: controller.orders.length),
        body: controller.orders.isEmpty
            ? const Center(
                child: Text(
                  'پرچیزنگ کی کوئی نئی درخواست موجود نہیں ہے!',
                  style: TextStyle(fontSize: 15, color: Color(0xFF64748B), fontWeight: FontWeight.bold),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                itemCount: controller.orders.length,
                itemBuilder: (context, index) {
                  final order = controller.orders[index];
                  final bool isExpanded = controller.expandedOrderIndex == index;
                  final bool inStock = order['isPurchasedByStock'];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFCBD5E1)),
                      boxShadow: const [BoxShadow(color: Color(0x0C000000), blurRadius: 8, offset: Offset(0, 2))],
                    ),
                    child: Column(
                      children: [
                        NewOrderRibbonUi(
                          productName: order['productName'],
                          date: order['date'],
                        ),
                        NewOrderHeaderTileUi(
                          order: order,
                          isExpanded: isExpanded,
                          onTap: () => controller.toggleOrderExpand(index),
                        ),
                        if (isExpanded) ...[
                          Container(
                            margin: const EdgeInsets.fromLTRB(8, 0, 8, 10),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF8FAFC),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: const Color(0xFFE2E8F0)),
                            ),
                            child: Column(
                              children: [
                                if (!inStock) ...[
                                  NewOrderStockAlertUi(
                                    order: order,
                                    priceController: controller.priceControllers[index]!,
                                    onSendWhatsApp: () => controller.sendWhatsAppCounterPrice(
                                      order['customerPhone'],
                                      order['productName'],
                                      order['customerQuotedPrice'] ?? 0,
                                      controller.priceControllers[index]!.text,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                ],
                                NewOrderProfitBannerUi(order: order),
                                const SizedBox(height: 6),
                                _buildSubCard(
                                  key: 'customer_$index',
                                  title: 'کسٹمر شناختی کوائف و رابطہ',
                                  icon: Icons.person_outline_rounded,
                                  controller: controller,
                                  content: NewOrderCustomerDetailsUi(
                                    order: order,
                                    onCall: () => controller.makePhoneCall(context, order['customerPhone']),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                _buildSubCard(
                                  key: 'guarantor_$index',
                                  title: 'ضامن کی معلومات (${order['guarantorName']})',
                                  icon: Icons.verified_user_outlined,
                                  controller: controller,
                                  content: NewOrderGuarantorDetailsUi(
                                    order: order,
                                    onCall: () => controller.makePhoneCall(context, order['guarantorPhone']),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                _buildSubCard(
                                  key: 'schedule_$index',
                                  title: 'اقساط کا شیڈول و سمری (${order['planMonths']} اقساط)',
                                  icon: Icons.table_chart_outlined,
                                  controller: controller,
                                  content: NewOrderScheduleTableUi(order: order),
                                ),
                                const SizedBox(height: 6),
                                if (order['hasAudio'] == true) ...[
                                  NewOrderAudioPlayerUi(duration: order['audioDuration']),
                                  const SizedBox(height: 6),
                                ],
                                _buildSubCard(
                                  key: 'docs_$index',
                                  title: 'قانونی دستاویزات، ای-اسٹامپ و مرجر',
                                  icon: Icons.gavel_rounded,
                                  controller: controller,
                                  content: NewOrderLegalDocsUi(
                                    order: order,
                                    onToggleStamp: () {
                                      controller.updateChecklist(index, 'stampUploaded', !(order['stampUploaded'] ?? false));
                                    },
                                  ),
                                ),
                                const SizedBox(height: 6),
                                _buildSubCard(
                                  key: 'legal_$index',
                                  title: 'تحویل چیک لسٹ، ڈبہ سیکیورٹی و سیلفی',
                                  icon: Icons.checklist_rounded,
                                  controller: controller,
                                  content: NewOrderHandoverChecklistUi(
                                    order: order,
                                    notesController: controller.handoverNotes[index]!,
                                    onUpdateChecklist: (key, val) => controller.updateChecklist(index, key, val),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                NewOrderActionButtonsUi(
                                  inStock: inStock,
                                  order: order,
                                  onApprove: () => controller.approveOrder(context, index),
                                  onReject: () => controller.rejectOrder(context, index),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }

  Widget _buildSubCard({
    required String key,
    required String title,
    required IconData icon,
    required NewOrderRequestsController controller,
    required Widget content,
  }) {
    final bool isOpen = controller.isSubOpen(key);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFCBD5E1)),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => controller.toggleSub(key),
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                children: [
                  Icon(icon, size: 16, color: const Color(0xFF1E293B)),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(isOpen ? Icons.remove_circle_outline_rounded : Icons.add_circle_outline_rounded, size: 16, color: const Color(0xFF64748B)),
                ],
              ),
            ),
          ),
          if (isOpen) ...[
            const Divider(height: 1, thickness: 1, color: Color(0xFFF1F5F9)),
            Padding(padding: const EdgeInsets.all(8), child: content),
          ],
        ],
      ),
    );
  }
}