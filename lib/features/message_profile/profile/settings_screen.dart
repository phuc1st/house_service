import 'package:flutter/material.dart';
import 'settings_model.dart';
import 'edit_settings_screen.dart';
import 'package:project/shared/widgets/app_header.dart';
import 'package:project/shared/widgets/app_bottom_navigation_bar.dart';
import 'package:project/shared/theme/theme_controller.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppHeader(
        title: 'Cài đặt',
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ExpansionTile(
                  leading: Icon(Icons.person_outline, color: Colors.orange.shade700),
                  title: const Text('Tài khoản', style: TextStyle(fontWeight: FontWeight.w600)),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            initialValue: _data.name,
                            decoration: const InputDecoration(labelText: 'Tên', border: OutlineInputBorder()),
                            enabled: false,
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            initialValue: _data.email,
                            decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                            enabled: false,
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            initialValue: _data.phone,
                            decoration: const InputDecoration(labelText: 'SDT', border: OutlineInputBorder()),
                            enabled: false,
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: _onEditAccount,
                                child: const Text('Chỉnh sửa'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ExpansionTile(
                  leading: Icon(Icons.notifications_outlined, color: Colors.orange.shade700),
                  title: const Text('Thông báo', style: TextStyle(fontWeight: FontWeight.w600)),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Column(
                        children: [
                          CheckboxListTile(
                            value: _data.pushEnabled,
                            onChanged: (v) => setState(() => _data.pushEnabled = v ?? false),
                            title: const Text('Push'),
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                          CheckboxListTile(
                            value: _data.emailEnabled,
                            onChanged: (v) => setState(() => _data.emailEnabled = v ?? false),
                            title: const Text('Email'),
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                          CheckboxListTile(
                            value: _data.smsEnabled,
                            onChanged: (v) => setState(() => _data.smsEnabled = v ?? false),
                            title: const Text('SMS'),
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ExpansionTile(
                  leading: Icon(Icons.payment_outlined, color: Colors.orange.shade700),
                  title: const Text('Thanh toán', style: TextStyle(fontWeight: FontWeight.w600)),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Column(
                        children: [
                          for (var i = 0; i < _data.paymentMethods.length; i++)
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: const Icon(Icons.credit_card),
                              title: Text(_data.paymentMethods[i]),
                              trailing: TextButton(
                                onPressed: () => setState(() => _data.paymentMethods.removeAt(i)),
                                child: const Text('Xóa', style: TextStyle(color: Colors.red)),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ExpansionTile(
                  leading: Icon(Icons.location_on_outlined, color: Colors.orange.shade700),
                  title: const Text('Địa chỉ', style: TextStyle(fontWeight: FontWeight.w600)),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Column(
                        children: [
                          for (var addr in _data.addresses)
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(bottom: 8),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey.shade300)),
                              child: Text(addr),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ExpansionTile(
                  leading: Icon(Icons.lock_outline, color: Colors.orange.shade700),
                  title: const Text('Bảo mật', style: TextStyle(fontWeight: FontWeight.w600)),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ElevatedButton(onPressed: _onChangePassword, child: const Text('Đổi mật khẩu')),
                          const SizedBox(height: 8),
                          ElevatedButton(onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Quản lý 2FA'))), child: const Text('Quản lý 2FA')),
                          const SizedBox(height: 12),
                    
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Dark Mode'),
                                Switch(
                                  value: _data.darkMode,
                                  onChanged: (v) {
                                    setState(() => _data.darkMode = v);
                                    ThemeController.setDark(v);
                                  },
                                  activeColor: Colors.orange.shade700,
                                ),
                              ],
                            ),
                  ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNavigationBar(currentIndex: 3),
    );
  }

  @override
  void initState() {
    super.initState();
    _data.darkMode = ThemeController.isDark.value;
    ThemeController.isDark.addListener(_themeListener);
  }

  @override
  void dispose() {
    ThemeController.isDark.removeListener(_themeListener);
    super.dispose();
  }

  void _themeListener() {
    if (mounted) setState(() => _data.darkMode = ThemeController.isDark.value);
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
