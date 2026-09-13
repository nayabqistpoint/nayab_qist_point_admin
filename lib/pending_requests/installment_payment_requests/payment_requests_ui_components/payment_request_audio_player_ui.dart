import 'package:flutter/material.dart';

class PaymentRequestAudioPlayerUi extends StatelessWidget {
  final String duration;
  final bool isPlaying;
  final double progress;
  final VoidCallback onTogglePlay;
  final ValueChanged<double> onProgressChanged;

  const PaymentRequestAudioPlayerUi({
    super.key,
    required this.duration,
    required this.isPlaying,
    required this.progress,
    required this.onTogglePlay,
    required this.onProgressChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFCBD5E1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.mic_rounded, size: 15, color: Color(0xFF059669)),
              const SizedBox(width: 5),
              const Expanded(
                child: Text(
                  'کسٹمر کا صوتی پیغام:',
                  style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                duration,
                style: const TextStyle(fontSize: 10.5, color: Color(0xFF64748B), fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: onTogglePlay,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: Color(0xFF059669),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 5),
                      trackHeight: 3,
                      activeTrackColor: const Color(0xFF059669),
                      inactiveTrackColor: const Color(0xFFCBD5E1),
                      thumbColor: const Color(0xFF059669),
                      overlayShape: SliderComponentShape.noOverlay,
                    ),
                    child: Slider(
                      value: progress,
                      onChanged: onProgressChanged,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.volume_up_rounded, size: 15, color: Color(0xFF64748B)),
                const SizedBox(width: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}