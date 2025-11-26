import 'package:flutter/material.dart';
import 'package:project/shared/widgets/app_header.dart';
import 'package:project/shared/widgets/app_primary_button.dart';
import 'package:project/shared/widgets/app_bottom_navigation_bar.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: 'Nguyen Van A');
  final _phoneController = TextEditingController(text: '0872 243 743');
  final _emailController = TextEditingController(text: 'nguyenvana@gmail.com');
  final _addressController = TextEditingController(text: '470 Trần Đại Nghĩa, ĐN');

  String _securityOption = 'Đổi mật khẩu';
  bool _showPasswordFields = false;

  final _oldPwdController = TextEditingController();
  final _newPwdController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _oldPwdController.dispose();
    _newPwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppHeader(
        title: 'Chỉnh sửa thông tin',
        backgroundColor: Colors.white,
        onBack: () => Navigator.pop(context),
      ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 44,
                            backgroundColor: Colors.orange.shade50,
                            child: Icon(Icons.person, size: 44, color: Colors.orange.shade700),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: CircleAvatar(
                              radius: 14,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.camera_alt, size: 16, color: Colors.black54),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),

                    _buildLabelledField('Họ và tên', controller: _nameController),
                    const SizedBox(height: 10),
                    _buildLabelledField('SDT', controller: _phoneController, keyboardType: TextInputType.phone),
                    const SizedBox(height: 10),
                    _buildLabelledField('Email', controller: _emailController, keyboardType: TextInputType.emailAddress),
                    const SizedBox(height: 10),
                    _buildLabelledField('Địa chỉ', controller: _addressController),

                    const SizedBox(height: 14),
                    const Text('Bảo mật & Đăng nhập', style: TextStyle(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),

                    DropdownButtonFormField<String>(
                      value: _securityOption,
                      items: const [
                        DropdownMenuItem(value: 'Đổi mật khẩu', child: Text('Đổi mật khẩu')),
                        DropdownMenuItem(value: 'Tài khoản liên kết', child: Text('Tài khoản liên kết')),
                      ],
                      onChanged: (v) {
                        setState(() {
                          _securityOption = v ?? 'Đổi mật khẩu';
                          _showPasswordFields = _securityOption == 'Đổi mật khẩu';
                        });
                      },
                    ),

                    const SizedBox(height: 12),

                    AnimatedCrossFade(
                      firstChild: _buildLinkedAccountsSection(),
                      secondChild: _buildChangePasswordSection(),
                      crossFadeState: _showPasswordFields ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 250),
                    ),

                    const SizedBox(height: 18),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.pop(context),
                            style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
                            child: const Text('Hủy bỏ'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: AppPrimaryButton(
                            label: 'Lưu Thay đổi',
                            onPressed: _onSave,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ),
      bottomNavigationBar: const AppBottomNavigationBar(currentIndex: 3),
    );
  }

  Widget _buildLabelledField(String label, {required TextEditingController controller, TextInputType keyboardType = TextInputType.text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.black87)),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
          validator: (v) => (v == null || v.isEmpty) ? 'Không được để trống' : null,
        ),
      ],
    );
  }

  Widget _buildLinkedAccountsSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(child: Text('Tài khoản liên kết', style: TextStyle(color: Colors.black54))),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade700),
            child: const Text('Liên kết'),
          ),
        ],
      ),
    );
  }

  Widget _buildChangePasswordSection() {
    return Column(
      children: [
        const SizedBox(height: 8),
        TextFormField(
          controller: _oldPwdController,
          obscureText: true,
          decoration: InputDecoration(labelText: 'Mật khẩu cũ', border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          validator: (v) {
            if (_showPasswordFields && (v == null || v.isEmpty)) return 'Nhập mật khẩu cũ';
            return null;
          },
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: _newPwdController,
          obscureText: true,
          decoration: InputDecoration(labelText: 'Mật khẩu mới', border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          validator: (v) {
            if (_showPasswordFields && (v == null || v.length < 6)) return 'Mật khẩu ít nhất 6 ký tự';
            return null;
          },
        ),
      ],
    );
  }

  void _onSave() {
    if (_formKey.currentState?.validate() ?? false) {
      // TODO: persist changes to backend or state
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đã lưu thay đổi')));
      Navigator.pop(context);
    }
  }

}
