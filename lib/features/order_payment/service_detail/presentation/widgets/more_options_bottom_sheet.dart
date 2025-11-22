import 'package:flutter/material.dart';

class MoreOptionsBottomSheet extends StatelessWidget {
  const MoreOptionsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Chia sẻ'),
            onTap: () {
              Navigator.of(context).pop();
              // Handle share
            },
          ),
          ListTile(
            leading: const Icon(Icons.flag),
            title: const Text('Báo cáo'),
            onTap: () {
              Navigator.of(context).pop();
              // Handle report
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

