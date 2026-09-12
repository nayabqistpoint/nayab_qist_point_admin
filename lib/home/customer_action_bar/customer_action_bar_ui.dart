import 'package:flutter/material.dart';
import 'package:nayab_qist_point_admin/home/customer_action_bar/filter_capsule_chip_ui.dart';
import 'package:nayab_qist_point_admin/home/customer_action_bar/sort_dropdown_menu_ui.dart';

class CustomerActionBarUi extends StatefulWidget {
  const CustomerActionBarUi({super.key});

  @override
  State<CustomerActionBarUi> createState() => _CustomerActionBarUiState();
}

class _CustomerActionBarUiState extends State<CustomerActionBarUi> {
  int selectedFilterIndex = 0;
  String currentSortOption = 'a_z';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 4), // 🎯 vertical 6 -> 4
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8), // 🎯 vertical 10 -> 8
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // 🎯 جگہ کے مطابق سائز
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 6), // 🎯 10 -> 6
            Row(
              children: [
                _buildAddCustomerButton(),
                const SizedBox(width: 8),
                Expanded(child: _buildSearchBar()),
              ],
            ),
            const SizedBox(height: 6), // 🎯 10 -> 6
            _buildFilterChips(),
          ],
        ),
      ),
    );
  }

  // 🎯 1. ہیڈنگ پٹی
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          Container(width: 4, height: 16, color: const Color(0xFF2563EB)),
          const SizedBox(width: 6),
          const Text(
            'کسٹمر تلاش اور اندراج',
            style: TextStyle(
              fontSize: 13.5,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
            ),
          ),
        ],
      ),
    );
  }

  // 🎯 2. نیا کسٹمر بٹن
  Widget _buildAddCustomerButton() {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.person_add_alt_1_rounded, size: 16),
      label: const Text(
        'نیا کسٹمر',
        style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF334155),
        foregroundColor: Colors.white,
        elevation: 1.5,
        minimumSize: const Size(0, 38), // 🎯 40 -> 38
        padding: const EdgeInsets.symmetric(horizontal: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  // 🎯 3. سرچ بار اور سارٹ ڈراپ ڈاؤن
  Widget _buildSearchBar() {
    return Container(
      height: 38, // 🎯 40 -> 38
      padding: const EdgeInsets.only(right: 10, left: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.search_rounded, color: Colors.black54, size: 18),
          const SizedBox(width: 6),
          const Expanded(
            child: Text(
              'نام یا نمبر تلاش کریں...',
              style: TextStyle(color: Colors.black45, fontSize: 10.5),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            height: 18,
            width: 1,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            color: const Color(0xFFE2E8F0),
          ),
          SortDropdownMenuUi(
            onSortSelected: (value) => setState(() => currentSortOption = value),
          ),
        ],
      ),
    );
  }

  // 🎯 4. فلٹر کیپسولز لسٹ
  Widget _buildFilterChips() {
    final filters = [
      {'label': 'تمام کسٹمرز', 'count': 142, 'color': const Color(0xFF334155), 'icon': Icons.people_alt_rounded},
      {'label': 'لیٹ قسط', 'count': 15, 'color': const Color(0xFFDC2626), 'icon': Icons.warning_amber_rounded},
      {'label': 'کلیئر کھاتے', 'count': 127, 'color': const Color(0xFF16A34A), 'icon': Icons.check_circle_outline_rounded},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: List.generate(filters.length, (index) {
          final filter = filters[index];
          return Padding(
            padding: const EdgeInsets.only(left: 6),
            child: FilterCapsuleChipUi(
              label: filter['label'] as String,
              count: filter['count'] as int,
              activeColor: filter['color'] as Color,
              icon: filter['icon'] as IconData,
              isSelected: selectedFilterIndex == index,
              onTap: () => setState(() => selectedFilterIndex = index),
            ),
          );
        }),
      ),
    );
  }
}