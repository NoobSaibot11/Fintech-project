import 'package:flutter/material.dart';
import '../Pages/StudentPages/LandingPage/ProfilePages/profile_page.dart';

class AppSearchBar extends StatelessWidget implements PreferredSizeWidget {
  const AppSearchBar({Key? key}) : super(key: key);

  void goToProfilePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfilePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*.95,
      height: MediaQuery.of(context).size.width*.15,
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Remove the shadow
        leading: IconButton(
          icon: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Icon(
              Icons.menu,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        title: const TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            border: InputBorder.none,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => goToProfilePage(context),
              child: const CircleAvatar(
                backgroundImage: AssetImage('lib/digiAppIcons/profile.jpg'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
