import 'package:flutter/material.dart';

class ReceivablePayableSummaryUi extends StatelessWidget {
  const ReceivablePayableSummaryUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildCard(
            title: 'قابل وصول',
            amount: 'Rs. 12,40,000',
            icon: Icons.arrow_downward_rounded,
            color: const Color(0xFF16A34A),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildCard(
            title: 'قابل ادائیگی',
            amount: 'Rs. 45,000',
            icon: Icons.arrow_upward_rounded,
            color: const Color(0xFFDC2626),
          ),
        ),
      ],
    );
  }

  Widget _buildCard({
    required String title,
    required String amount,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(icon, size: 14, color: color.withValues(alpha: 0.85)),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 10,
                    color: color.withValues(alpha: 0.85),
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              amount,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}