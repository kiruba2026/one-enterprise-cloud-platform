import 'package:flutter/material.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool isMobile = constraints.maxWidth < 500;

          if (isMobile) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '© 2026 OneCloud Enterprise Platform',
                  style: TextStyle(fontSize: 12, color: Color(0xFF65676B)),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _footerButton('Help'),
                    _footerButton('Privacy'),
                    _footerButton('Terms'),
                  ],
                ),
              ],
            );
          }

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '© 2026 OneCloud Enterprise Platform',
                style: TextStyle(fontSize: 12, color: Color(0xFF65676B)),
              ),
              Row(
                children: [
                  _footerButton('Help'),
                  _footerButton('Privacy'),
                  _footerButton('Terms'),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _footerButton(String title) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(title, style: const TextStyle(fontSize: 12)),
    );
  }
}
