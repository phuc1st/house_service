import 'package:flutter/material.dart';
import '../../../shared/widgets/app_bottom_navigation_bar.dart';
import '../models/activity_model.dart';
import '../widgets/activity_card.dart';
import '../widgets/in_progress_activity_card.dart';
import '../widgets/completed_activity_card.dart';
import 'rating_screen.dart';

// MAIN ACTIVITY SCREEN
class WaitingActivityScreen extends StatefulWidget {
  const WaitingActivityScreen({super.key});

  @override
  State<WaitingActivityScreen> createState() => _WaitingActivityScreenState();
}

class _WaitingActivityScreenState extends State<WaitingActivityScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 1; // Select "Activity" tab in Bottom Nav Bar
  late TabController _tabController;
  final List<String> _tabs = [
    'Đang chờ',
    'Đang làm',
    'Hoàn thành',
    'Đã hủy'
  ];

  @override
  void initState() {
    super.initState();
    // Initialize TabController with 4 tabs, starting at "Canceled" (index 3)
    _tabController = TabController(length: _tabs.length, vsync: this, initialIndex: 3);

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Function to navigate to the Rating Screen
  void _navigateToRatingScreen(CompletedActivityModel activity) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RatingScreen(activity: activity),
      ),
    ).then((_) {
      // Rebuild the UI when returning from RatingScreen
      setState(() {
        // Find the activity in the list and mark it as rated (for demonstration)
        final index = completedActivities.indexWhere((a) => a.orderCode == activity.orderCode);
        if (index != -1 && !completedActivities[index].hasRated) {
          // This is a simple in-memory update for the mock data
          completedActivities[index] = CompletedActivityModel(
            orderCode: activity.orderCode,
            staffName: activity.staffName,
            staffAvatarUrl: activity.staffAvatarUrl,
            date: activity.date,
            time: activity.time,
            location: activity.location,
            status: activity.status,
            statusColor: activity.statusColor,
            hasRated: true, // Set to true after rating
          );
        }
      });
    });
  }


  // Widget to display the Waiting activities list
  Widget _buildWaitingList() {
    // Uses ActivityCard with full details
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: waitingActivities.length,
      itemBuilder: (context, index) {
        return ActivityCard(activity: waitingActivities[index], showFullDetails: true);
      },
    );
  }

  // Widget to display the In Progress activities list
  Widget _buildInProgressList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: inProgressActivities.length,
      itemBuilder: (context, index) {
        return InProgressActivityCard(activity: inProgressActivities[index]);
      },
    );
  }

  // Widget to display the Completed activities list
  Widget _buildCompletedList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: completedActivities.length,
      itemBuilder: (context, index) {
        final activity = completedActivities[index];
        return CompletedActivityCard(
          activity: activity,
          // Pass the navigation function for the rating button
          onRatePressed: () => _navigateToRatingScreen(activity),
        );
      },
    );
  }

  // Widget to display the Canceled activities list
  Widget _buildCanceledList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: canceledActivities.length,
      itemBuilder: (context, index) {
        return CanceledActivityCard(activity: canceledActivities[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7F0), // Light cream background
      // AppBar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.only(left: 0.0),
          child: Text('Hoạt động', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87, size: 20),
          onPressed: () {
            // Handle back event
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.more_vert, color: Colors.black87),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        // Custom TabBar
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Container(
            color: Colors.white,
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                indicatorPadding: EdgeInsets.zero,
                labelPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                indicatorColor: Colors.transparent,
                indicator: const BoxDecoration(
                  color: Colors.transparent,
                ),
                tabs: _tabs.map((name) {
                  // Custom TabBar button
                  final isSelected = _tabController.index == _tabs.indexOf(name);
                  return Tab(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFFD97200) // Dark Orange when selected
                            : Colors.grey[200], // Light gray when not selected
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        name,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),

      // Body containing the TabBarView content
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildWaitingList(),
          _buildInProgressList(),
          _buildCompletedList(),
          _buildCanceledList(),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: const AppBottomNavigationBar(
        currentIndex: 1,
      ),
    );
  }
}