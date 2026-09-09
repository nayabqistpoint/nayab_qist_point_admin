import 'package:flutter/material.dart';
import 'package:nayab_qist_point_admin/home/customer_action_bar/customer_action_bar_logic.dart';

class CustomerActionBarUI extends StatelessWidget {
  const CustomerActionBarUI({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = CustomerActionBarLogic();

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'کسٹمر نام یا نمبر تلاش کریں...',
                  prefixIcon: const Icon(Icons.search),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Theme.of(context).cardColor,
                ),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.person_add, size: 18),
              label: const Text('نیا کسٹمر'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0F172A),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(logic.filters.length, (index) {
              final isSelected = index == logic.selectedFilterIndex;
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ChoiceChip(
                  label: Text(logic.filters[index]),
                  selected: isSelected,
                  selectedColor: const Color(0xFF0F172A),
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontSize: 12,
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}