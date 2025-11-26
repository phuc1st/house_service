import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';
import 'settings_screen.dart';
import 'favorites_screen.dart';
import '../report_incident/report_incident_screen.dart';
import '../service_packages/service_packages_screen.dart';
import '../family_tips/family_tips_screen.dart';
import '../loyalty/loyalty_screen.dart';
import 'package:project/shared/widgets/app_bottom_navigation_bar.dart';
import 'package:project/shared/widgets/app_header.dart';
import 'package:project/shared/widgets/app_primary_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppHeader(
        onBack: () => Navigator.pop(context),
        title: 'Tài khoản',
        backgroundColor: Colors.white,
      ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 8),
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 48,
                        backgroundColor: Colors.orange.shade50,
                        child: Icon(Icons.person, size: 56, color: Colors.orange.shade700),
                      ),
                      const SizedBox(height: 12),
                      Text('Nguyen Van A', style: textTheme.titleMedium?.copyWith(fontSize: 20, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 6),
                      Text('0912 337 456', style: textTheme.bodySmall?.copyWith(color: Colors.black54)),
                      const SizedBox(height: 4),
                      Text('nguyenvana@gmail.com', style: textTheme.bodySmall?.copyWith(color: Colors.black54)),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: 220,
                        child: AppPrimaryButton(
                          label: 'Chỉnh sửa thông tin',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const EditProfileScreen()),
                            );
                          },
                          expand: false,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                Text('Quản lý & Hỗ trợ', style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: 12),

                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      _buildMenuItem(context, Icons.settings, 'Cài đặt'),
                      const Divider(height: 1),
                      _buildMenuItem(context, Icons.favorite_border, 'Dịch vụ yêu thích'),
                      const Divider(height: 1),
                      _buildMenuItem(context, Icons.report, 'Báo cáo sự cố'),
                      const Divider(height: 1),
                      _buildMenuItem(context, Icons.card_giftcard, 'Gói dịch vụ'),
                      const Divider(height: 1),
                      _buildMenuItem(context, Icons.lightbulb_outline, 'Mẹo vặt'),
                      const Divider(height: 1),
                      _buildMenuItem(context, Icons.people, 'Hạng thành viên'),
                      const Divider(height: 1),
                      _buildMenuItem(context, Icons.payment, 'Phương thức thanh toán'),
                      const Divider(height: 1),
                      _buildMenuItem(context, Icons.help_outline, 'Trợ giúp'),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                AppPrimaryButton(
                  label: 'Đăng xuất',
                  onPressed: () {
                    // TODO: implement logout
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đăng xuất')));
                  },
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      bottomNavigationBar: const AppBottomNavigationBar(currentIndex: 3),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        if (title == 'Cài đặt') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const SettingsScreen()),
          );
        } else if (title == 'Phương thức thanh toán') {
          // placeholder: could navigate to payment methods screen
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Phương thức thanh toán')));
        } else if (title == 'Dịch vụ yêu thích') {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const FavoritesScreen()));
        } else if (title == 'Báo cáo sự cố') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ReportIncidentScreen()),
          );
        } else if (title == 'Gói dịch vụ') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ServicePackagesScreen()),
          );
        } else if (title == 'Mẹo vặt') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const FamilyTipsScreen()),
          );
        } else if (title == 'Hạng thành viên') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const LoyaltyScreen()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
        }
      },
    );
  }
}
