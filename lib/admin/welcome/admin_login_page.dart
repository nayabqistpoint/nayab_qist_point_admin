import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

// 🎯 آپ کی ہوم فائل کا اصلی پاتھ
import 'package:nayab_qist_point_admin/admin/home_page/sections/top.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final LocalAuthentication _localAuth = LocalAuthentication();
  bool _isAuthenticating = false;

  @override
  void initState() {
    super.initState();
    // پیج کھلتے ہی آٹو فنگر پرنٹ کی درخواست
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _authenticateWithBiometrics();
    });
  }

  // 🎯 فنگر پرنٹ بائیو میٹرک لاگ ان
  Future<void> _authenticateWithBiometrics() async {
    try {
      bool canCheckBiometrics = await _localAuth.canCheckBiometrics;
      bool isDeviceSupported = await _localAuth.isDeviceSupported();

      if (canCheckBiometrics && isDeviceSupported) {
        setState(() => _isAuthenticating = true);

        // 🎯 کسی بھی ورژنز کے ایرر سے پاک سادہ بائیو میٹرک لاگ ان
        bool authenticated = await _localAuth.authenticate(
          localizedReason: 'ایڈمن پورٹل کھولنے کے لیے اپنا فنگر پرنٹ لگائیں',
        );

        if (mounted) {
          setState(() => _isAuthenticating = false);
        }

        if (authenticated && mounted) {
          _openDashboard();
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isAuthenticating = false);
      }
      debugPrint("Biometric Error: $e");
    }
  }

  // 🎯 ہوم سکرین کی طرف نیویگیشن
  void _openDashboard() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const TopSection()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8), // وائٹ اور لائٹ گریش تھیم
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),

            // 1. لوگو اور موبائل بزنس برانڈنگ
            Center(
              child: Column(
                children: [
                  Container(
                    width: 95,
                    height: 95,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.06),
                          blurRadius: 15,
                          spreadRadius: 3,
                        ),
                      ],
                      border: Border.all(color: Colors.grey.shade300, width: 2),
                    ),
                    child: Icon(
                      Icons.smartphone_rounded,
                      size: 50,
                      color: Colors.red.shade800,
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'نایاب قسط پوائنٹ',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.verified_user_rounded, size: 16, color: Colors.green.shade700),
                      const SizedBox(width: 4),
                      Text(
                        'موبائل اینڈ الیکٹرانکس ایڈمن پورٹل',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Spacer(),

            // 2. فنگر پرنٹ کارڈ
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                padding: const EdgeInsets.all(26.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 12,
                      spreadRadius: 1,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'ایڈمن لاگ ان',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'ڈیش بورڈ کھولنے کے لیے فنگر پرنٹ لگائیں',
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 24),

                    // فنگر پرنٹ آئیکن
                    InkWell(
                      onTap: _authenticateWithBiometrics,
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red.shade50,
                          border: Border.all(color: Colors.red.shade200, width: 2),
                        ),
                        child: _isAuthenticating
                            ? SizedBox(
                                width: 46,
                                height: 46,
                                child: CircularProgressIndicator(
                                  color: Colors.red.shade800,
                                  strokeWidth: 3,
                                ),
                              )
                            : Icon(
                                Icons.fingerprint_rounded,
                                size: 48,
                                color: Colors.red.shade800,
                              ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'انگلی کا نشان لگائیں',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade800,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // ڈائریکٹ بٹن
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: OutlinedButton.icon(
                        onPressed: _openDashboard,
                        icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                        label: const Text(
                          'ڈائریکٹ ایڈمن ہوم کھولیں',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black87,
                          side: BorderSide(color: Colors.grey.shade300, width: 1.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            // 3. فوٹر
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Nayab Qist Point • Mobile & Installment Management',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}