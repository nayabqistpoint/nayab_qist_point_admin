import 'package:flutter/material.dart';

class NewOrderAudioPlayerUi extends StatelessWidget {
  final String duration;

  const NewOrderAudioPlayerUi({super.key, required this.duration});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFCBD5E1)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(7),
            decoration: const BoxDecoration(color: Color(0xFF059669), shape: BoxShape.circle),
            child: const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 8),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('کسٹمر کا وائس میسج (صوتی پیغام)', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
                SizedBox(height: 3),
                LinearProgressIndicator(value: 0.35, minHeight: 4, backgroundColor: Color(0xFFE2E8F0), valueColor: AlwaysStoppedAnimation(Color(0xFF059669))),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(duration, style: const TextStyle(fontSize: 11.5, color: Color(0xFF64748B), fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}