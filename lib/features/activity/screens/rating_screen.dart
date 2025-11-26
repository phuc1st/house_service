import 'package:flutter/material.dart';
import '../models/activity_model.dart';

// RATING SCREEN
class RatingScreen extends StatefulWidget {
  final CompletedActivityModel activity;

  const RatingScreen({super.key, required this.activity});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double _currentRating = 4.0; // Default 4 stars
  final TextEditingController _commentController = TextEditingController();

  // Function to build stars
  Widget _buildStar(int index) {
    IconData icon;
    Color color;

    if (index >= _currentRating.floor()) {
      // Empty star
      icon = Icons.star_border;
      color = Colors.orange;
    } else {
      // Filled star
      icon = Icons.star;
      color = Colors.orange;
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentRating = index + 1.0;
        });
      },
      child: Icon(
        icon,
        color: color,
        size: 50.0,
      ),
    );
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7F0), // Light cream background
      appBar: AppBar(
        title: const Text('Hoạt động', style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87, size: 20),
          onPressed: () => Navigator.of(context).pop(), // Close screen
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.more_vert, color: Colors.black87),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Center(
          child: Column(
            children: [
              // RATING CARD
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(color: Colors.black12, width: 0.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      // Staff Avatar & Name
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(widget.activity.staffAvatarUrl),
                        backgroundColor: Colors.grey[200],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Quản lý chất lượng',
                        style: TextStyle(color: Colors.black54, fontSize: 13),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.activity.staffName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        '5.0/5 (400 việc)', // Hardcoded rating/jobs from previous step
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                      ),
                      const SizedBox(height: 24),

                      // Star rating row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) => _buildStar(index)),
                      ),
                      const SizedBox(height: 24),

                      // Comment field
                      TextField(
                        controller: _commentController,
                        decoration: InputDecoration(
                          hintText: 'Bình luận...',
                          labelText: 'Đánh giá',
                          labelStyle: const TextStyle(color: Colors.black54),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Color(0xFFD97200)),
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        ),
                        maxLines: 3,
                      ),
                      const SizedBox(height: 24),

                      // Submit button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle submit rating logic
                            final rating = _currentRating;
                            final comment = _commentController.text;
                            debugPrint('Rating: $rating stars, Comment: $comment');
                            // Navigate back to the Activity screen
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFD97200), // Dark Orange
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Gửi đánh giá',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}