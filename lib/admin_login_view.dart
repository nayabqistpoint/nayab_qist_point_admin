import 'package:flutter/material.dart';
import 'package:nayab_qist_point_admin/admin_home_page.dart'; // 👈 نیا ہوم پیج امپورٹ کر دیا گیا ہے

class AdminLoginView extends StatefulWidget {
  const AdminLoginView({super.key});

  @override
  State<AdminLoginView> createState() => _AdminLoginViewState();
}

class _AdminLoginViewState extends State<AdminLoginView> {
  // 🎯 بیک گراؤنڈ تھیم سوئچ کرنے کے لیے (1 سے 5)
  int selectedBgOption = 1;

  // 🚀 اگلے پیج پر جانے کا لاجک
  void _navigateToAdminHome() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AdminHomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // اوپر تھیم بدلنے کی بار
      appBar: AppBar(
        title: const Text('بیک گراؤنڈ تھیم تبدیل کریں', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          PopupMenuButton<int>(
            icon: const Icon(Icons.color_lens_rounded, color: Colors.greenAccent),
            onSelected: (int item) {
              setState(() {
                selectedBgOption = item;
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
              const PopupMenuItem<int>(value: 1, child: Text('1. Mint Green Soft (ہلکا منٹ)')),
              const PopupMenuItem<int>(value: 2, child: Text('2. Deep Emerald Luxury (گہرا زمردی)')),
              const PopupMenuItem<int>(value: 3, child: Text('3. Royal Navy Slate (نیوی بلیو)')),
              const PopupMenuItem<int>(value: 4, child: Text('4. Warm Gold & Dark (گولڈ اینڈ ڈارک)')),
              const PopupMenuItem<int>(value: 5, child: Text('5. Clean Soft Grey (سادہ گرے)')),
            ],
          ),
        ],
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        width: double.infinity,
        height: double.infinity,
        decoration: _getBackgroundDecoration(),
        child: SafeArea(
          child: Column(
            children: [
              // ===============================================================
              // 1. ٹاپ بار (سسٹم آن لائن + سیٹنگز)
              // ===============================================================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // آن لائن سٹیٹس کیپسول (جیسا آپ نے کہا، اس کو نارمل رہنے دیا ہے)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.08),
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 9,
                            height: 9,
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'سسٹم آن لائن',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),

                    // سیٹنگز اور کوئیک ڈیش بورڈ آئیکنز
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.8),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.settings_outlined, color: Colors.black87),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // ===============================================================
              // 2. درمیانی ورٹیکل کارڈ
              // ===============================================================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(color: Colors.green.shade200, width: 1.5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.shade900.withValues(alpha: 0.1),
                        blurRadius: 25,
                        spreadRadius: 2,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // لوگو
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.green.shade200, width: 2),
                        ),
                        child: Icon(
                          Icons.smartphone_rounded,
                          size: 42,
                          color: Colors.green.shade700,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // بزنس نیم
                      const Text(
                        'نایاب قسط پوائنٹ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // اونر نیم
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.green.shade200),
                        ),
                        child: Text(
                          'پروپرائیٹر: حافظ محمد صابر',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade900,
                          ),
                        ),
                      ),
                      const SizedBox(height: 36),

                      // 🎯 فنگر پرنٹ بٹن (یہاں سے AdminHomePage پر نیویگیٹ ہوگا)
                      InkWell(
                        onTap: _navigateToAdminHome,
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green.shade600,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.green.shade400.withValues(alpha: 0.4),
                                blurRadius: 18,
                                spreadRadius: 2,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.fingerprint_rounded,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),

                      Text(
                        'فنگر پرنٹ سے لاگ ان کریں',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(),

              // ===============================================================
              // 3. نیلا / ڈارک فوٹر سیکشن
              // ===============================================================
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0, left: 24.0, right: 24.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.85),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.cloud_done_rounded, size: 16, color: Colors.green.shade700),
                          const SizedBox(width: 6),
                          const Text(
                            'ڈیٹا بیس سنک: فعال',
                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black87),
                          ),
                        ],
                      ),
                      Text(
                        'ورژن v1.0.2',
                        style: TextStyle(fontSize: 11, color: Colors.grey.shade700, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ===========================================================================
  // 🎨 بیک گراؤنڈ گریڈینٹس کا فنکشن
  // ===========================================================================
  BoxDecoration _getBackgroundDecoration() {
    switch (selectedBgOption) {
      case 1: // Mint Green Soft
        return const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE8F5E9), Color(0xFFC8E6C9), Color(0xFFF1F8E9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        );
      case 2: // Deep Emerald Luxury
        return const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        );
      case 3: // Royal Navy Slate
        return const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1E3A8A), Color(0xFF3B82F6), Color(0xFFEFF6FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        );
      case 4: // Warm Gold & Dark
        return const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF18181B), Color(0xFF27272A), Color(0xFF3F3F46)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        );
      case 5: // Clean Soft Grey
        return const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE2E8F0), Color(0xFFF1F5F9), Color(0xFFFFFFFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        );
      default:
        return const BoxDecoration(color: Color(0xFFE8F5E9));
    }
  }
}