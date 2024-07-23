import 'dart:ui'; // Import for ImageFilter

import 'package:flutter/material.dart';

class ClearAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function() onBack;

  const ClearAppBar({super.key, required this.title, required this.onBack});

  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: height *0.12,
          color: Colors.black.withOpacity(0.5), // Adjust the opacity to make it clear
          child: AppBar(
            title: Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white), // Set the icon color to white
              onPressed: onBack,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(125);
}
