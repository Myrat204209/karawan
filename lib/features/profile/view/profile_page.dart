import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:karawan/app/core/page_cacher.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageCacher = GetIt.I<PageCacher>();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back),
                ),
                const Expanded(
                  child: Text(
                    'Profile',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),

          // Profile Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Account Section
                  _buildProfileSection('Hasabym', [
                    _buildProfileItem(
                      icon: Icons.person,
                      title: 'Hasabym',
                      onTap: () {
                        // Navigate to account details
                      },
                    ),
                    _buildProfileItem(
                      icon: Icons.notifications,
                      title: 'Bildiriş',
                      onTap: () {
                        // Navigate to notifications
                      },
                    ),
                  ]),

                  const SizedBox(height: 20),

                  // Other Section
                  _buildProfileSection('Beýlekiler', [
                    _buildProfileItem(
                      icon: Icons.language,
                      title: 'Türkmen dili',
                      onTap: () {
                        // Navigate to language settings
                      },
                    ),
                    _buildProfileItem(
                      icon: Icons.help,
                      title: 'Biz barada',
                      onTap: () {
                        // Navigate to about us
                      },
                    ),
                    _buildProfileItem(
                      icon: Icons.logout,
                      title: 'Hasapdan çykmak',
                      onTap: () {
                        // Handle logout
                        pageCacher.clearRoute();
                        context.go('/director');
                      },
                    ),
                    _buildProfileItem(
                      icon: Icons.feedback,
                      title: 'Teswir ýazmak',
                      onTap: () {
                        // Navigate to feedback
                      },
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != 'Hasabym')
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
              ),
            ),
          ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildProfileItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: _getIconColor(icon).withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(icon, color: _getIconColor(icon), size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }

  Color _getIconColor(IconData icon) {
    switch (icon) {
      case Icons.person:
      case Icons.notifications:
        return AppColors.getSectionAccent(AppSection.store);
      case Icons.language:
        return Colors.blue;
      case Icons.help:
        return AppColors.getSectionAccent(AppSection.store);
      case Icons.logout:
        return Colors.green;
      case Icons.feedback:
        return Colors.green;
      default:
        return AppColors.getSectionAccent(AppSection.store);
    }
  }
}
