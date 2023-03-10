import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharm_traka/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../../providers/navigation_provider.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthProvider>().curruentUser;

    return ListTile(
      leading: InkWell(
        onTap: (() => context.read<NavigationProvider>().setCurrentIndex(3)),
        child: CircleAvatar(
            backgroundColor: Colors.green.shade100,
            backgroundImage: AssetImage('assets/images/profile.jpg')),
      ),
      title: Text('Welcome'),
      subtitle: Text(user?.displayName ?? 'name'),
      trailing: FaIcon(
        Icons.notifications_active_outlined,
        color: Colors.green,
      ),
    );
  }
}
