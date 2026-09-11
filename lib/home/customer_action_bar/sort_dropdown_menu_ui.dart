import 'package:flutter/material.dart';

class SortDropdownMenuUi extends StatelessWidget {
  final ValueChanged<String> onSortSelected;

  const SortDropdownMenuUi({
    super.key,
    required this.onSortSelected,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: onSortSelected,
      tooltip: 'ترتیب دیں',
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.white,
      elevation: 4,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: Icon(
          Icons.swap_vert_rounded,
          color: Color(0xFF2563EB),
          size: 19,
        ),
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        // 🎯 گروپ 1: نام کی بنیاد پر (A to Z / Z to A)
        const PopupMenuItem<String>(
          value: 'a_z',
          child: Row(
            children: [
              Icon(Icons.sort_by_alpha_rounded, size: 16, color: Color(0xFF1E293B)),
              SizedBox(width: 8),
              Text('نام (A سے Z)', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        const PopupMenuItem<String>(
          value: 'z_a',
          child: Row(
            children: [
              Icon(Icons.sort_by_alpha_rounded, size: 16, color: Color(0xFF1E293B)),
              SizedBox(width: 8),
              Text('نام (Z سے A)', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
            ],
          ),
        ),

        const PopupMenuDivider(),

        // 🎯 گروپ 2: رقم / بقایا جات (زیادہ سے کم / کم سے زیادہ)
        const PopupMenuItem<String>(
          value: 'highest_balance',
          child: Row(
            children: [
              Icon(Icons.arrow_upward_rounded, size: 16, color: Colors.red),
              SizedBox(width: 8),
              Text('زیادہ سے کم بقایا جات', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        const PopupMenuItem<String>(
          value: 'lowest_balance',
          child: Row(
            children: [
              Icon(Icons.arrow_downward_rounded, size: 16, color: Colors.green),
              SizedBox(width: 8),
              Text('کم سے زیادہ بقایا جات', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
            ],
          ),
        ),

        const PopupMenuDivider(),

        // 🎯 گروپ 3: تاریخ / وقت (نیا سے پرانا / پرانا سے نیا)
        const PopupMenuItem<String>(
          value: 'newest_first',
          child: Row(
            children: [
              Icon(Icons.history_toggle_off_rounded, size: 16, color: Color(0xFF2563EB)),
              SizedBox(width: 8),
              Text('نئے سے پرانا (Newest First)', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        const PopupMenuItem<String>(
          value: 'oldest_first',
          child: Row(
            children: [
              Icon(Icons.history_rounded, size: 16, color: Color(0xFF64748B)),
              SizedBox(width: 8),
              Text('پرانے سے نیا (Oldest First)', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ],
    );
  }
}