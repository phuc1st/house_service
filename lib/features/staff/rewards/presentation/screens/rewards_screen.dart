import 'package:flutter/material.dart';
import 'package:project/shared/widgets/app_gradient_background.dart';
import 'package:project/shared/widgets/app_header.dart';
import 'package:project/shared/widgets/staff_bottom_navigation_bar.dart';
import '../../data/models/reward.dart';
import '../../data/rewards_mock_data.dart';
import '../widgets/reward_tabs.dart';
import '../widgets/reward_card.dart';

class RewardsScreen extends StatefulWidget {
  const RewardsScreen({super.key});

  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  int _selectedTabIndex = 0;

  List<Reward> get _currentRewards {
    switch (_selectedTabIndex) {
      case 0:
        return mockTodayRewards;
      case 1:
        return mockUpcomingRewards;
      case 2:
        return mockPastRewards;
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const AppHeader(
          title: 'Tiền thưởng',
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            const SizedBox(height: 8),
            // Tabs
            RewardTabs(
              selectedIndex: _selectedTabIndex,
              onTabChanged: (index) {
                setState(() {
                  _selectedTabIndex = index;
                });
              },
            ),
            const SizedBox(height: 8),
            // Rewards List
            Expanded(
              child: _currentRewards.isEmpty
                  ? Center(
                      child: Text(
                        'Chưa có phần thưởng',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.only(bottom: 16),
                      itemCount: _currentRewards.length,
                      itemBuilder: (context, index) {
                        return RewardCard(
                          reward: _currentRewards[index],
                        );
                      },
                    ),
            ),
          ],
        ),
        bottomNavigationBar: const StaffBottomNavigationBar(
          currentIndex: 3,
        ),
      ),
    );
  }
}

