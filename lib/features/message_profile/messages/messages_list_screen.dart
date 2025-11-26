import 'package:flutter/material.dart';
import 'package:project/shared/widgets/app_header.dart';
import 'package:project/shared/widgets/app_bottom_navigation_bar.dart';
import 'chat_screen.dart';
import 'notifications_screen.dart';

class MessagesListScreen extends StatefulWidget {
  const MessagesListScreen({Key? key}) : super(key: key);

  @override
  State<MessagesListScreen> createState() => _MessagesListScreenState();
}

class _MessagesListScreenState extends State<MessagesListScreen> {
  bool showChats = true;

  final List<Map<String, String>> chats = List.generate(
    8,
    (i) => {
      'name': 'Lê Văn A',
      'last': 'chào bạn, tôi có thể giúp gì cho bạn...',
      'time': '${15 - i}m',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppHeader(
        title: 'Tin nhắn',
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => showChats = true),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: showChats ? Colors.orange.shade700 : Colors.orange.shade50,
                        ),
                        child: Center(
                          child: Text('Trò chuyện', style: TextStyle(color: showChats ? Colors.white : Colors.orange.shade700)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const NotificationsScreen())),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: showChats ? Colors.orange.shade50 : Colors.orange.shade700,
                        ),
                        child: Center(child: Text('Thông báo', style: TextStyle(color: showChats ? Colors.orange.shade700 : Colors.white))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                itemCount: chats.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, i) {
                  final c = chats[i];
                  return Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: CircleAvatar(backgroundColor: Colors.blue.shade50, child: const Icon(Icons.person, color: Colors.blue)),
                      title: Text(c['name']!, style: const TextStyle(fontWeight: FontWeight.w600)),
                      subtitle: Text(c['last']!),
                      trailing: Text(c['time']!, style: const TextStyle(color: Colors.black45, fontSize: 12)),
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ChatScreen(name: c['name']!))),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNavigationBar(currentIndex: 2),
    );
  }
}
