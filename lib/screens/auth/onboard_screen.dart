import 'package:flutter/material.dart';
import 'package:laza_ecommerce/screens/auth/get_start_screen.dart';
import 'package:laza_ecommerce/widgets/auth_widgets/subtitle_text.dart';
import 'package:laza_ecommerce/widgets/auth_widgets/title_text.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentGeometry.centerLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFB9A7FF), Color(0xFF8F7BFF)],
              ),
            ),
            child: Center(),
          ),
          Positioned(
            top: size.height * 0.15,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                "assets/icons/onboard_hero.png",
                height: size.height * 0.85,
                fit: BoxFit.contain,
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(26, 22, 26, 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TitleText(text: 'Look Good, Feel Good'),
                      const SizedBox(height: 8),
                      SubtitleText(
                        text:
                            "Create your individual & unique style and\nlook amazing everyday.",
                      ),
                      const SizedBox(height: 16),

                      Row(
                        children: [
                          Expanded(
                            child: _PillButton(
                              label: 'Male',
                              selected: selected == 0,
                              onTap: () => setState(() => selected = 0),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _PillButton(
                              label: 'Female',
                              selected: selected == 1,
                              onTap: () => setState(() => selected = 1),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => GetStartScreen())),
                        child: Text('Skip'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PillButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _PillButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bg = selected ? const Color(0xFF8F7BFF) : const Color(0xFFF1F2F6);
    final fg = selected ? Colors.white : Colors.black.withOpacity(0.55);
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 52,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: fg,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
