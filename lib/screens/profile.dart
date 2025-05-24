import 'package:flutter/material.dart';
import 'package:easy_meal/screens/AboutApp_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void _launchURL() async {
  final Uri url = Uri.parse('https://www.univ-tlemcen.dz/fr');
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}

void _showLogoutDialog(BuildContext context) {
  
  showDialog(
    context: context,
    
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      title: const Text("Log Out",style: TextStyle(
                fontFamily: 'roboto',
                color: Color.fromARGB(255, 255, 0, 0),
              ),),
      content: const Text("Are you sure you want to log out?",style: TextStyle(
                fontFamily: 'roboto',
                color: Color.fromARGB(255, 0, 0, 0),
              ),),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel",style: TextStyle(
                fontFamily: 'roboto',
                color: Color.fromARGB(255, 0, 0, 0),
              ),),
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                      const Text(
                        'Bendimerad Mohamed el Mahdi',
                        style: TextStyle(
                          fontSize: 16,
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
                    MaterialPageRoute(builder: (context) => const AboutAppPage()),
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
            Divider(color: Colors.grey.shade400, thickness: 1),
            SizedBox(height: 2.h),
            Text(
              'Statistiques',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatCard('Total Repas in the week', '24'),
                  _buildStatCard('Average Meal Rating', '⭐⭐⭐⭐☆', isHighlighted: true),
                ],
              ),
            ),
            SizedBox(height: 5.h),
          ],
        ),
      ),
    );
  }
  Widget _buildSettingsOption(
      BuildContext context, IconData icon, String title, String subtitle, VoidCallback onTap) {
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
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16),
      onTap: onTap,
    );
  }

  Widget _buildStatCard(String title, String value, {bool isHighlighted = false}) {
    return Container(
      width: 38.w,
      height: 22.h,
      padding: EdgeInsets.all(3.h),
      decoration: BoxDecoration(
        color: isHighlighted ? const Color.fromARGB(255, 255, 128, 0) : Colors.white,
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


