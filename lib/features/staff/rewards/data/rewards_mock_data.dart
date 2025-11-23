import 'models/reward.dart';

// Mock rewards data
final List<Reward> mockTodayRewards = [
  const Reward(
    date: '11 thg 11',
    countdown: 'Sắp kết thúc trong 8 giờ 36 phút',
    title: 'Thưởng mỗi ngày khi tích lũy ngọc gắn kết theo mức độ khó khăn trong công việc',
    description:
        'Thanh toán mỗi ngày, sau 18h ngày làm việc tiếp theo, cộng vào ví dưới của đối tác. Nghĩa vụ thuế Thu nhập',
    accumulatedValue: 0,
  ),
  const Reward(
    date: '11 thg 11',
    countdown: 'Sắp kết thúc trong 8 giờ 36 phút',
    title: 'Chương trình thưởng dành cho đối tác có độ gắn kết cao',
    description: '',
    accumulatedValue: 0,
    progressMin: 0,
    progressCurrent: 0,
    progressMax: 100,
  ),
];

final List<Reward> mockUpcomingRewards = [];

final List<Reward> mockPastRewards = [];


