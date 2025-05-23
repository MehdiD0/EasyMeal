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
          title: Text(
            "Log Out",
            style: AppTheme.titleStyle.copyWith(
              color: Colors.red,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          content: Text(
            "Are you sure you want to log out?",
            style: AppTheme.paragraphStyle.copyWith(
              color: Colors.black,
              fontSize: 16.sp,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Cancel",
                style: AppTheme.labelStyle.copyWith(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // TODO: Navigate to login page
              },
              child: Text(
                "Logout",
                style: AppTheme.labelStyle.copyWith(color: Colors.red),
              ),
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
      bottomNavigationBar: BottomNavBar(currentIndex: 3),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header
              Text(
                'Profile',
                style: AppTheme.titleStyle.copyWith(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: AppTheme.primaryColor,
                  letterSpacing: 1.1,
                ),
              ),
              SizedBox(height: 3.h),

              // Profile Info Container
              Container(
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
                      backgroundImage: const AssetImage('assets/profile.jpg'),
                    ),
                    SizedBox(width: 5.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bendimerad Mohamed el Mahdi',
                          style: AppTheme.labelStyle.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '@itz_dii',
                          style: AppTheme.paragraphStyle.copyWith(
                            fontSize: 14.sp,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 4.h),

              // Settings Options
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
                    'Access help and support',
                    _launchURL,
                  ),
                  _buildSettingsOption(
                    context,
                    Icons.info,
                    'About App',
                    'Learn more about this app',
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
                    'Add extra security to your account',
                    () {},
                  ),
                  _buildSettingsOption(
                    context,
                    Icons.logout,
                    'Log out',
                    'Sign out of your account',
                    () => _showLogoutDialog(context),
                  ),
                ],
              ),

              SizedBox(height: 4.h),

              // Divider
              Container(width: 100.w, height: 2, color: AppTheme.primaryColor),
              SizedBox(height: 2.h),
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
        style: AppTheme.labelStyle.copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: AppTheme.paragraphStyle.copyWith(
          fontSize: 14.sp,
          color: Colors.grey.shade600,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
