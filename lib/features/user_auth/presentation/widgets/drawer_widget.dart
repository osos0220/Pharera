import 'package:Pharera/features/user_auth/presentation/widgets/list_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:Pharera/navigation_bar.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onProfileTap;
  final void Function()? onSignOut;

  const MyDrawer({
    super.key,
    required this.onProfileTap,
    required this.onSignOut,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 174, 158, 130),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //header
              const DrawerHeader(
                  child: Icon(
                Icons.person,
                color: Colors.white,
                size: 64,
              )),
              //home list tile
              MyListTile(
                  icon: Icons.home,
                  text: 'Home',
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyHomePage()),
                      )),

              //profile list tile
              MyListTile(
                icon: Icons.person,
                text: 'profile',
                onTap: onProfileTap,
              ),
            ],
          ),

          //logout list tile
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              icon: Icons.logout,
              text: 'Log out',
              onTap: onSignOut,
            ),
          ),
        ],
      ),
    );
  }
}
