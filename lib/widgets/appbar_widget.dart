import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final String title;
  final bool centerTitle;
  final List<Widget>? actions;

  const MyAppBar({
    super.key,
    required this.title,
    required this.appBar,
    this.centerTitle = true,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: Colors.grey.shade900,
      foregroundColor: Colors.white,
      elevation: 0,
      shape: const Border(
        bottom: BorderSide(
          color: Colors.white60,
          width: 1,
        ),
      ),
      centerTitle: centerTitle,
      titleSpacing: -10,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
