import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/screens/home_screen.dart';
import 'package:flutter_social_ui/screens/login_screen.dart';
import 'package:flutter_social_ui/screens/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  _buildDrawerOption(Icon icon, String title, Function onTap) {
    return ListTile(
      leading: icon,
      title: Text(title,
          style: TextStyle(
            fontSize: 20.0,
          )),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(
                  user: currentUser,
                ),
              ),
            ),
            child: Stack(
              children: [
                Image(
                  height: 200.0,
                  width: double.infinity,
                  image: AssetImage(currentUser.backgroundImageUrl),
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 20.0,
                  left: 20.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 100.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [],
                          border: Border.all(
                            width: 3.0,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        child: ClipOval(
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              currentUser.profileImageUrl,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 6.0),
                      Text(
                        currentUser.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          _buildDrawerOption(
            Icon(Icons.dashboard),
            'Home',
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            ),
          ),
          _buildDrawerOption(
            Icon(Icons.account_circle),
            'My Profile',
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(
                  user: currentUser,
                ),
              ),
            ),
          ),
          _buildDrawerOption(Icon(Icons.chat), 'Chat', () {}),
          _buildDrawerOption(Icon(Icons.location_on), 'Map', () {}),
          _buildDrawerOption(Icon(Icons.settings), 'Settings', () {}),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: _buildDrawerOption(
                Icon(Icons.exit_to_app),
                'Logout',
                () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
