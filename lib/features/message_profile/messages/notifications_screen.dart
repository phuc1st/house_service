import 'package:flutter/material.dart';
import 'package:project/shared/widgets/app_header.dart';
import 'package:project/shared/widgets/app_bottom_navigation_bar.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<Map<String, dynamic>> _notes = List.generate(
    8,
    (i) => {
      'title': 'Nhập mã CLEAN5 để giảm 50%',
      'body': 'Bạn ơi với ưu đãi tuyệt vời hãy nhập mã này vào để được giảm giá nhé!',
      'read': false,
    },
  );

  void _toggleRead(int index) {
    setState(() {
      _notes[index]['read'] = !(_notes[index]['read'] as bool);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_notes[index]['read'] ? 'Đã đánh dấu đã đọc' : 'Đã bỏ đánh dấu')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppHeader(
        title: 'Thông báo',
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: _notes.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, i) {
            final n = _notes[i];
            final read = n['read'] as bool;
            return ListTile(
              leading: Icon(Icons.local_offer, color: Colors.orange.shade700),
              title: Text(n['title'], style: TextStyle(fontWeight: FontWeight.w600, color: read ? Colors.black45 : Colors.black87)),
              subtitle: Text(n['body'] as String, maxLines: 2, overflow: TextOverflow.ellipsis),
              trailing: IconButton(onPressed: () => _toggleRead(i), icon: Icon(read ? Icons.check_circle : Icons.circle_outlined, color: read ? Colors.green : Colors.grey)),
              onTap: () => _toggleRead(i),
            );
          },
        ),
      ),
      bottomNavigationBar: const AppBottomNavigationBar(currentIndex: 2),
    );
  }
}
