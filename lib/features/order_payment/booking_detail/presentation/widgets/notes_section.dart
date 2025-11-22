import 'package:flutter/material.dart';
import '../../data/models/booking_detail.dart';

class NotesSection extends StatefulWidget {
  const NotesSection({
    super.key,
    required this.bookingDetail,
    required this.onNotesChanged,
  });

  final BookingDetail bookingDetail;
  final ValueChanged<String> onNotesChanged;

  @override
  State<NotesSection> createState() => _NotesSectionState();
}

class _NotesSectionState extends State<NotesSection> {
  late TextEditingController _notesController;

  @override
  void initState() {
    super.initState();
    _notesController = TextEditingController(text: widget.bookingDetail.notes);
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.black.withOpacity(0.1),
          width: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.edit,
                size: 20,
                color: Color(0xFFB23D0A),
              ),
              const SizedBox(width: 8),
              const Text(
                'Ghi chú và yêu cầu',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  fontFamily: 'Quicksand',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _notesController,
            maxLines: 4,
            decoration: InputDecoration(
              hintText:
                  'Ví dụ: Mang theo dụng cụ dọn dẹp, tập trung dọn dẹp khu vực bếp và phòng khách, không làm phiền thú cưng ...',
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.black.withOpacity(0.3),
                fontFamily: 'Quicksand',
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFFB23D0A)),
              ),
              contentPadding: const EdgeInsets.all(12),
            ),
            onChanged: (value) {
              widget.onNotesChanged(value);
            },
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(
                Icons.info_outline,
                size: 16,
                color: Colors.grey,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Vui lòng cung cấp chi tiết rõ ràng để đối tác phụ vụ tốt nhất',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.5),
                    fontFamily: 'Quicksand',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
