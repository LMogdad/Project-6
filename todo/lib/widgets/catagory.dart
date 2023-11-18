import 'package:flutter/material.dart';

class Catagory extends StatelessWidget {
  const Catagory({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
    this.isSelected = false,
    required this.onTap,
  });
  final IconData icon;
  final String text;
  final Color color;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xffe4e1f8) : Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey.withOpacity(0.4)),
              ),
              child: Icon(icon, color: color),
            ),
            const SizedBox(height: 8),
            Text(text)
          ],
        ),
      ),
    );
  }
}
