import 'package:flutter/material.dart';
import 'package:todo/widgets/radio_button.dart';

class Task extends StatelessWidget {
  const Task({
    super.key,
    required this.text,
    required this.isCompleted,
    required this.id,
    required this.onTap,
    required this.onPressedDelete,
  });
  final String text;
  final bool isCompleted;
  final int id;
  final Function() onTap;
  final Function() onPressedDelete;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 16),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 55,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey.withOpacity(0.4)),
          ),
          child: Row(
            children: [
              RadioBotton(
                isCompleted: isCompleted,
              ),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
              ),
              IconButton(
                onPressed: onPressedDelete,
                icon: const Icon(
                  Icons.delete_rounded,
                  size: 20,
                  color: Colors.redAccent,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
