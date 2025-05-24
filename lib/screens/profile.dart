import 'package:easy_meal/components/bottom_nav_bar.dart';
import 'package:easy_meal/helpers/app_theme.dart';
import 'package:easy_meal/screens/AboutApp_page.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

void _launchURL() async {
  final Uri url = Uri.parse('https://www.univ-tlemcen.dz/fr');
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}

void _showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,

    builder:
        (context) => AlertDialog(
          backgroundColor: Colors.white,
          title: const Text(
            "Log Out",
            style: TextStyle(
              fontFamily: 'roboto',
              color: Color.fromARGB(255, 255, 0, 0),
            ),
          ),
          content: const Text(
            "Are you sure you want to log out?",
            style: TextStyle(
              fontFamily: 'roboto',
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Cancel",
                style: TextStyle(
                  fontFamily: 'roboto',
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // goto login page
              },
              child: const Text("Logout", style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
  );
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 2.h),
              const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(255, 255, 128, 0),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 5,
                      spreadRadius: 2,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 4.5.h,
                      backgroundImage: AssetImage('assets/profile.jpg'),
                    ),
                    SizedBox(width: 5.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bendimerad Mohamed el Mahdi',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '@itz_dii',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4.h),
              Column(
                children: [
                  _buildSettingsOption(
                    context,
                    Icons.person,
                    'My Account',
                    'Make changes to your account',
                    () {},
                  ),
                  _buildSettingsOption(
                    context,
                    Icons.help,
                    'Help and Support',
                    'Help and Support',
                    _launchURL,
                  ),
                  _buildSettingsOption(
                    context,
                    Icons.info,
                    'About App',
                    'About App',
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutAppPage(),
                      ),
                    ),
                  ),
                  _buildSettingsOption(
                    context,
                    Icons.security,
                    'Two-Factor Authentication',
                    'Further secure your account for safety',
                    () {},
                  ),
                  _buildSettingsOption(
                    context,
                    Icons.logout,
                    'Log out',
                    'Further secure your account for safety',
                    () => _showLogoutDialog(context),
                  ),
                ],
              ),
              SizedBox(height: 1.h),
              SizedBox(height: 13.h),
              Container(width: 100.w, height: 2, color: AppTheme.primaryColor),
              SizedBox(height: 2.h),
              BottomNavBar(currentIndex: 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsOption(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.black,
        size: 16,
      ),
      onTap: onTap,
    );
  }

  Widget _buildStatCard(
    String title,
    String value, {
    bool isHighlighted = false,
  }) {
    return Container(
      width: 38.w,
      height: 22.h,
      padding: EdgeInsets.all(3.h),
      decoration: BoxDecoration(
        color:
            isHighlighted
                ? const Color.fromARGB(255, 255, 128, 0)
                : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isHighlighted ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 3.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isHighlighted ? Colors.white : Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
