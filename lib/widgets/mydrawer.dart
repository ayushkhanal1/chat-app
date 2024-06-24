import 'package:chat_app/methods/auth_methods.dart';
import 'package:chat_app/screens/login_screens.dart';
import 'package:chat_app/screens/settings.dart';
import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    void signout(BuildContext context) async {
      final auth = AuthMethods();
      try {
        await auth.signout();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      } catch (e) {
        print(
          e.toString(),
        );
      }
    }

    return Drawer(
      backgroundColor: Colors.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 110),
            child: const Icon(
              Icons.message,
              size: 70,
              color: Color.fromARGB(255, 74, 73, 73),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 400),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('H O M E '),
                  onTap: () => Navigator.pop(context),
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('S E T T I N G S'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SettingScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            child: ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log out '),
              onTap: () => signout(context),
            ),
          ),
        ],
      ),
    );
  }
}
