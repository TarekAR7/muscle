import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String image_path;
  final Function()? onTap;
  const SquareTile({
    super.key,
    required this.onTap, required this.image_path,
  });
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Image.asset(image_path,
          height: 40,),
      ),
    );
  }
}