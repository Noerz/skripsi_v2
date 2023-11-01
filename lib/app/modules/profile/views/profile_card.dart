import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final IconData iconL;
  final VoidCallback onTap;

  const ProfileCard({
    required this.title,
    required this.icon,
    required this.iconL,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Card(
          child: ListTile(
            leading: Icon(icon, size: 20),
            title: Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
            trailing: Icon(iconL, size: 20),
          ),
        ));
  }
}
