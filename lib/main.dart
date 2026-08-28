import 'dart:ui'; 
import 'package:flutter/material.dart'; 
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'تطبيق الزجاج السائل الذكي',
      theme: ThemeData(
        brightness: Brightness.dark, 
        primarySwatch: Colors.cyan,
      ),
      home: MainDashboard(), // تم حذف const من هنا لمنع الخطأ
    );
  }
}

// -------------------------------------------------------------
// 1. القائمة الرئيسية بنمط الزجاج السائل (Liquid Glass Dashboard)
// -------------------------------------------------------------
class MainDashboard extends StatelessWidget {
  const MainDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // أشكال سائلة متدرجة الألوان في الخلفية (Liquid Background Shapes)
          Positioned(
            top: -100,
            right: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [Colors.cyanAccent, Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            left: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [Colors.purpleAccent, Colors.transparent],
                ),
              ),
            ),
          ),
          
          // واجهة المستخدم الأمامية بنمط الزجاج الشفاف
          SafeArea(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 40),
                    const Text(
                      "التحكم الذكي السائل",
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 50),

                    // 1. وضع الرسائل (Messages Mode)
                    _buildGlassButton(
                      context,
                      title: "وضع الرسائل (Messages Mode)",
                      subtitle: "تراسل محلي مشفر عبر البلوتوث",
                      icon: Icons.chat_bubble_outline,
                      page: const MessagesModeScreen(),
                    ),
                    const SizedBox(height: 25),

                    // 2. وضع الذكاء الاصطناعي (AI Mode)
                    _buildGlassButton(
                      context,
                      title: "وضع العميل الذكي (AI Mode)",
                      subtitle: "مساعد رقمي محلي متقدم للإجابة على أسئلتك",
                      icon: Icons.psychology_outlined,
                      page: const AIModeScreen(),
                    ),
                    const SizedBox(height: 25),

                    // 3. وضع الرادار والبحث (Scanning Mode)
                    _buildGlassButton(
                      context,
                      title: "وضع الرادار والبحث (Scanning Mode)",
                      subtitle: "مسح فوري ورصد الأجهزة في منطقتك المجاورة",
                      icon: Icons.bluetooth_searching,
                      page: const ScanningModeScreen(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // دالة مخصصة لإنشاء تأثير الزجاج السائل الضبابي (Glassmorphism Widget)
  Widget _buildGlassButton(BuildContext context, {required String title, required String subtitle, required IconData icon, required Widget page}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15), 
        child: InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => page)),
          child: Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.07), 
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: Colors.white.withOpacity(0.15), 
                width: 1.5,
              ),
            ),
            child: Row(
              children: [
                Icon(icon, size: 32, color: Colors.cyanAccent),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                      Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// -------------------------------------------------------------
// 2. وضع الرسائل (Messages Mode)
// -------------------------------------------------------------
class MessagesModeScreen extends StatelessWidget {
  const MessagesModeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("وضع الرسائل")),
      body: const Center(child: Text("شاشة الرسائل المحلية عبر البلوتوث")),
    );
  }
}

// -------------------------------------------------------------
// 3. وضع الذكاء الاصطناعي (AI Mode)
// -------------------------------------------------------------
class AIModeScreen extends StatelessWidget {
  const AIModeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("وضع الذكاء الاصطناعي")),
      body: const Center(child: Text("شاشة التحدث مع الـ AI Agent")),
    );
  }
}

// -------------------------------------------------------------
// 4. وضع الرادار والبحث (Scanning Mode)
// -------------------------------------------------------------
class ScanningModeScreen extends StatelessWidget {
  const ScanningModeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("scanning mode")), // تم حذف const الداخلية من هنا لمنع الخطأ
      body: const Center(child: Text("list of all devices in your zone")),
    );
  }
}
