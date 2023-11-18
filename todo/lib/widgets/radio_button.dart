import 'package:flutter/material.dart';

class RadioBotton extends StatelessWidget {
  const RadioBotton({
    super.key,
    required this.isCompleted,
  });
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ClipOval(
        child: Container(
          width: 25,
          height: 25,
          color: const Color(0xff8eabe0),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: ClipOval(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: ClipOval(
                    child: Container(
                      color: isCompleted ? Color(0xff8eabe0) : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
