import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../providers/navigation_provider.dart';

class User extends StatelessWidget {
  const User({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: InkWell(
        onTap: (() => context.read<NavigationProvider>().setCurrentIndex(3)),
        child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.jpg')),
      ),
      title: Text('Welcome'),
      subtitle: Text('Jon Dua'),
      trailing: FaIcon(
        Icons.notifications_active_outlined,
        color: Colors.green,
      ),
    );
  }
}
