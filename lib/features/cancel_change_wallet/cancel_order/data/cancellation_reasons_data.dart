import 'models/cancellation_reason.dart';

final List<CancellationReason> cancellationReasons = [
  const CancellationReason(
    id: 'sudden_work',
    label: 'Bận việc đột xuất',
  ),
  const CancellationReason(
    id: 'wrong_day',
    label: 'Đăng nhầm ngày',
  ),
  const CancellationReason(
    id: 'worker_unavailable',
    label: 'Người làm báo không đến được',
  ),
  const CancellationReason(
    id: 'no_longer_needed',
    label: 'Không cần công việc này nữa',
  ),
];

