import 'package:flutter/material.dart';
import 'settings_model.dart';
import 'edit_settings_screen.dart';
import 'package:project/shared/widgets/app_gradient_background.dart';
import 'package:project/shared/widgets/app_header.dart';
import 'package:project/shared/widgets/app_bottom_navigation_bar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  SettingsData _data = SettingsData(
    name: 'Nguyen Văn A',
    email: 'nguyenvana@gmail.com',
    phone: '0763 238 889',
    pushEnabled: true,
    emailEnabled: true,
    smsEnabled: false,
    paymentMethods: ['Visa **** 4345667', 'MoMo'],
    addresses: ['Nhà chính\n325 Ngô Hạnh Sơn, Ngũ Hành Sơn, ĐN', 'Văn phòng\n470 Trần Đại Nghĩa, Ngũ Hành Sơn, ĐN'],
    darkMode: false,
  );

  @override
  Widget build(BuildContext context) {
    return AppGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const AppHeader(
          title: 'Cài đặt',
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              _buildSectionCard(
                title: 'Tài khoản',
                child: ListTile(
                  title: Text(_data.name),
                  subtitle: Text('${_data.phone}\n${_data.email}'),
                  isThreeLine: true,
                  trailing: const Icon(Icons.chevron_right),
                  onTap: _onEditAccount,
                ),
              ),

              const SizedBox(height: 12),

              _buildSectionCard(
                title: 'Thông báo',
                child: Column(
                  children: [
                    CheckboxListTile(
                      value: _data.pushEnabled,
                      title: const Text('Push'),
                      onChanged: (v) => setState(() => _data.pushEnabled = v ?? false),
                    ),
                    CheckboxListTile(
                      value: _data.emailEnabled,
                      title: const Text('Email'),
                      onChanged: (v) => setState(() => _data.emailEnabled = v ?? false),
                    ),
                    CheckboxListTile(
                      value: _data.smsEnabled,
                      title: const Text('SMS'),
                      onChanged: (v) => setState(() => _data.smsEnabled = v ?? false),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              _buildSectionCard(
                title: 'Thanh toán',
                child: Column(
                  children: _data.paymentMethods
                      .asMap()
                      .entries
                      .map((e) => ListTile(
                            title: Text(e.value),
                            trailing: TextButton(
                              onPressed: () => setState(() => _data.paymentMethods.removeAt(e.key)),
                              child: const Text('Xóa', style: TextStyle(color: Colors.red)),
                            ),
                          ))
                      .toList(),
                ),
              ),

              const SizedBox(height: 12),

              _buildSectionCard(
                title: 'Địa chỉ',
                child: Column(
                  children: _data.addresses
                      .map((a) => ListTile(
                            title: Text(a),
                          ))
                      .toList(),
                ),
              ),

              const SizedBox(height: 12),

              _buildSectionCard(
                title: 'Bảo mật',
                child: Column(
                  children: [
                    ListTile(
                      title: const Text('Đổi mật khẩu'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => _onChangePassword(),
                    ),
                    ListTile(
                      title: const Text('Quản lý 2FA'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Quản lý 2FA'))),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  const Icon(Icons.nights_stay, color: Colors.black54),
                  const SizedBox(width: 8),
                  const Expanded(child: Text('Dark Mode')),
                  Switch(
                    value: _data.darkMode,
                    onChanged: (v) => setState(() => _data.darkMode = v),
                    activeColor: Colors.orange.shade700,
                  ),
                ],
              ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const AppBottomNavigationBar(currentIndex: 3),
      ),
    );
  }

  Widget _buildSectionCard({required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Card(elevation: 0, child: Padding(padding: const EdgeInsets.all(12), child: child)),
      ],
    );
  }

  void _onEditAccount() async {
    final result = await Navigator.push<SettingsData>(
      context,
      MaterialPageRoute(builder: (_) => EditSettingsScreen(data: _data)),
    );
    if (result != null) {
      setState(() {
        _data = result;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Thông tin tài khoản đã được cập nhật')));
    }
  }

  void _onChangePassword() {
    // simple placeholder flow
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Đổi mật khẩu'),
        content: const Text('Chức năng đổi mật khẩu (demo).'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Đóng')),
        ],
      ),
    );
  }
}
