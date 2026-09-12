import 'package:flutter/material.dart';

// آپ کے تصویر والے نام کے مطابق درست امپورٹ
import 'package:nayab_qist_point_admin/pending_requests/signup_requests/signup_requests_controller.dart';

// کمپوننٹس
import 'package:nayab_qist_point_admin/pending_requests/signup_requests/signup_requests_ui_components/signup_requests_app_bar_ui.dart';
import 'package:nayab_qist_point_admin/pending_requests/signup_requests/signup_requests_ui_components/signup_request_header_tile_ui.dart';
import 'package:nayab_qist_point_admin/pending_requests/signup_requests/signup_requests_ui_components/signup_request_personal_info_ui.dart';
import 'package:nayab_qist_point_admin/pending_requests/signup_requests/signup_requests_ui_components/signup_request_docs_tile_ui.dart';
import 'package:nayab_qist_point_admin/pending_requests/signup_requests/signup_requests_ui_components/signup_request_guarantor_card_ui.dart';
import 'package:nayab_qist_point_admin/pending_requests/signup_requests/signup_requests_ui_components/signup_request_action_buttons_ui.dart';

class SignupRequests extends StatefulWidget {
  const SignupRequests({super.key});

  @override
  State<SignupRequests> createState() => _SignupRequestsState();
}

class _SignupRequestsState extends State<SignupRequests> {
  final SignupRequestsController controller = SignupRequestsController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF1F5F9),
        appBar: SignupRequestsAppBarUi(count: controller.requests.length),
        body: controller.requests.isEmpty
            ? const Center(
                child: Text(
                  'کوئی نئی درخواست موجود نہیں ہے!',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF64748B),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : ListView(
                padding: const EdgeInsets.all(12),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x08000000),
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.requests.length,
                      separatorBuilder: (context, index) => const Divider(
                        height: 1,
                        thickness: 0.8,
                        indent: 14,
                        endIndent: 14,
                        color: Color(0xFFF1F5F9),
                      ),
                      itemBuilder: (context, index) {
                        final item = controller.requests[index];
                        final isExpanded = controller.expandedState[index] ?? false;
                        final docsOpen = controller.showDocs[index] ?? false;
                        final guarantorOpen = controller.showGuarantor[index] ?? false;

                        return Column(
                          children: [
                            // ہیڈر
                            SignupRequestHeaderTileUi(
                              name: item['name']!,
                              caste: item['caste']!,
                              date: item['date']!,
                              isExpanded: isExpanded,
                              onTap: () => controller.toggleExpand(index, () => setState(() {})),
                            ),

                            // تفصیلات
                            if (isExpanded) ...[
                              Container(
                                margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF8FAFC),
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(color: const Color(0xFFE2E8F0)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SignupRequestPersonalInfoUi(
                                      item: item,
                                      onCallTap: () => controller.makePhoneCall(context, item['phone']!),
                                    ),
                                    const SizedBox(height: 10),

                                    SignupRequestDocsTileUi(
                                      docsOpen: docsOpen,
                                      onToggle: () => controller.toggleDocs(index, () => setState(() {})),
                                    ),
                                    const SizedBox(height: 8),

                                    SignupRequestGuarantorCardUi(
                                      item: item,
                                      guarantorOpen: guarantorOpen,
                                      onToggle: () => controller.toggleGuarantor(index, () => setState(() {})),
                                    ),
                                    const SizedBox(height: 12),

                                    SignupRequestActionButtonsUi(
                                      onApprove: () => controller.approveRequest(context, index, () => setState(() {})),
                                      onReject: () => controller.rejectRequest(context, index, () => setState(() {})),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}