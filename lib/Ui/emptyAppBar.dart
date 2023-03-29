import 'package:flutter/material.dart';

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget{
  const EmptyAppBar({super.key});

  @override   
  Size get preferredSize => const Size.fromHeight(50.0);
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 50.0,
    );
  }
  }
   