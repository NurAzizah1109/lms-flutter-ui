import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
             const SizedBox(height: 24),
            _buildProfileHeader(),
            const SizedBox(height: 48),
            _buildMenuSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.shade100,
                border: Border.all(color: Colors.white, width: 4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Icon(
                Icons.person,
                size: 64,
                color: Colors.blue,
              ),
            ),
             Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.camera_alt,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'John Doe',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'johndoe@student.university.ac.id',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildMenuSection(BuildContext context) {
    return Column(
      children: [
        _buildMenuItem(
          icon: Icons.edit,
          title: 'Edit Profil',
          onTap: () {
            Navigator.pushNamed(context, '/edit-profile');
          },
        ),
        _buildMenuItem(
          icon: Icons.notifications,
          title: 'Notifikasi',
          onTap: () {},
        ),
        _buildMenuItem(
          icon: Icons.language,
          title: 'Bahasa',
          trailingText: 'Indonesia',
          onTap: () {},
        ),
        const Divider(height: 32),
        _buildMenuItem(
          icon: Icons.logout,
          title: 'Keluar',
          color: Colors.red,
          onTap: () {
            // Logout confirmation dialog could be added here
            Navigator.pushNamedAndRemoveUntil(
              context, 
              '/login', 
              (route) => false
            );
          },
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color color = const Color(0xFF333333), // Dark grey default
    String? trailingText,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: color),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: color,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailingText != null)
             Padding(
               padding: const EdgeInsets.only(right: 8.0),
               child: Text(
                 trailingText,
                 style: TextStyle(color: Colors.grey[500], fontSize: 14),
                ),
             ),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}
