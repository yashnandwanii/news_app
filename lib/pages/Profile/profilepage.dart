import 'package:flutter/material.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFF121220);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),

            // Avatar and User Info
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'assets/images/user_avatar.jpg'), // Replace with your image
            ),
            const SizedBox(height: 16),
            const Text(
              'Yash Nandwani',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            const Text(
              'yash@example.com',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 30),

            // Option List
            _buildOption(icon: Icons.bookmark, label: 'Saved Articles'),
            _buildOption(icon: Icons.settings, label: 'Settings'),
            _buildOption(icon: Icons.notifications, label: 'Notifications'),
            _buildOption(icon: Icons.feedback, label: 'Send Feedback'),

            const Spacer(),

            // Logout Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.logout),
                label: const Text('Log Out'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildOption({required IconData icon, required String label}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(label, style: const TextStyle(color: Colors.white)),
      trailing:
          const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
      onTap: () {
        // Handle option tap
      },
    );
  }
}
