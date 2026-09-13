import 'package:flutter/material.dart';

// 🎯 کنٹرولر کا امپورٹ
import 'package:nayab_qist_point_admin/pending_requests/installment_payment_requests/installment_payment_requests_controller.dart';

// 🎯 تمام یو آئی کمپوننٹس کے پیکیج امپورٹس
import 'package:nayab_qist_point_admin/pending_requests/installment_payment_requests/payment_requests_ui_components/payment_requests_app_bar_ui.dart';
import 'package:nayab_qist_point_admin/pending_requests/installment_payment_requests/payment_requests_ui_components/payment_request_ribbon_ui.dart';
import 'package:nayab_qist_point_admin/pending_requests/installment_payment_requests/payment_requests_ui_components/payment_request_header_tile_ui.dart';
import 'package:nayab_qist_point_admin/pending_requests/installment_payment_requests/payment_requests_ui_components/payment_request_progress_bar_ui.dart';
import 'package:nayab_qist_point_admin/pending_requests/installment_payment_requests/payment_requests_ui_components/payment_request_transaction_info_ui.dart';
import 'package:nayab_qist_point_admin/pending_requests/installment_payment_requests/payment_requests_ui_components/payment_request_schedule_table_ui.dart';
import 'package:nayab_qist_point_admin/pending_requests/installment_payment_requests/payment_requests_ui_components/payment_request_call_button_ui.dart';
import 'package:nayab_qist_point_admin/pending_requests/installment_payment_requests/payment_requests_ui_components/payment_request_receipt_tile_ui.dart';
import 'package:nayab_qist_point_admin/pending_requests/installment_payment_requests/payment_requests_ui_components/payment_request_audio_player_ui.dart';
import 'package:nayab_qist_point_admin/pending_requests/installment_payment_requests/payment_requests_ui_components/payment_request_action_buttons_ui.dart';

class InstallmentPaymentRequests extends StatefulWidget {
  const InstallmentPaymentRequests({super.key});

  @override
  State<InstallmentPaymentRequests> createState() => _InstallmentPaymentRequestsState();
}

class _InstallmentPaymentRequestsState extends State<InstallmentPaymentRequests> {
  late final InstallmentPaymentRequestsController _controller;

  @override
  void initState() {
    super.initState();
    _controller = InstallmentPaymentRequestsController(
      onUpdate: () => setState(() {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF1F5F9),

        // 🎯 1. ایپ بار کمپوننٹ
        appBar: PaymentRequestsAppBarUi(count: _controller.paymentRequests.length),

        // 🎯 2. باڈی
        body: _controller.paymentRequests.isEmpty
            ? const Center(
                child: Text(
                  'قسط کی کوئی نئی درخواست موجود نہیں ہے!',
                  style: TextStyle(fontSize: 15, color: Color(0xFF64748B), fontWeight: FontWeight.bold),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                itemCount: _controller.paymentRequests.length,
                itemBuilder: (context, index) {
                  final item = _controller.paymentRequests[index];
                  final isExpanded = _controller.expandedState[index] ?? false;
                  final scheduleOpen = _controller.showSchedule[index] ?? false;
                  final receiptOpen = _controller.showReceipt[index] ?? false;
                  final isPlayingAudio = _controller.isPlayingAudio[index] ?? false;
                  final audioProgress = _controller.audioProgress[index] ?? 0.35;

                  return Container(
                    margin: const EdgeInsets.only(bottom: 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFCBD5E1)),
                      boxShadow: const [BoxShadow(color: Color(0x0C000000), blurRadius: 10, offset: Offset(0, 3))],
                    ),
                    child: Column(
                      children: [
                        // 🎯 پٹی: ماڈل اور تاریخ
                        PaymentRequestRibbonUi(
                          item: item['item'],
                          date: item['date'],
                        ),

                        // 🎯 ہیڈر فیس: کسٹمر نام، قسط اور رقم
                        PaymentRequestHeaderTileUi(
                          item: item,
                          isExpanded: isExpanded,
                          onTap: () => _controller.toggleExpand(index),
                        ),

                        // 🎯 تفصیلی کارڈ
                        if (isExpanded) ...[
                          Container(
                            margin: const EdgeInsets.fromLTRB(12, 0, 12, 14),
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF8FAFC),
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(color: const Color(0xFFE2E8F0)),
                            ),
                            child: Column(
                              children: [
                                // 1. پروگریس بار
                                PaymentRequestProgressBarUi(
                                  current: item['currentInstallmentNo'],
                                  total: item['totalInstallments'],
                                ),
                                const SizedBox(height: 12),

                                // 2. ٹرانزیکشن تفصیل اور شارٹ الرٹ
                                PaymentRequestTransactionInfoUi(item: item),
                                const SizedBox(height: 12),

                                // 3. 12 اقساط شیڈول ٹیبل
                                PaymentRequestScheduleTableUi(
                                  scheduleList: item['schedule'],
                                  isOpen: scheduleOpen,
                                  onToggle: () => _controller.toggleSchedule(index),
                                ),
                                const SizedBox(height: 12),

                                // 4. کال بٹن
                                PaymentRequestCallButtonUi(
                                  phone: item['phone'],
                                  onCall: () => _controller.makePhoneCall(context, item['phone']),
                                ),
                                const SizedBox(height: 12),

                                // 5. رسید سلپ
                                PaymentRequestReceiptTileUi(
                                  isOpen: receiptOpen,
                                  onToggle: () => _controller.toggleReceipt(index),
                                ),
                                const SizedBox(height: 12),

                                // 6. آڈیو پلیئر
                                PaymentRequestAudioPlayerUi(
                                  duration: item['audioDuration'] ?? '0:35',
                                  isPlaying: isPlayingAudio,
                                  progress: audioProgress,
                                  onTogglePlay: () => _controller.toggleAudioPlay(index),
                                  onProgressChanged: (val) => _controller.updateAudioProgress(index, val),
                                ),
                                const SizedBox(height: 14),

                                // 7. ایکشن بٹنز (تصدیق / تردید)
                                PaymentRequestActionButtonsUi(
                                  onApprove: () => _controller.approvePayment(context, index),
                                  onReject: () => _controller.rejectPayment(context, index),
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
}