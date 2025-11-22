import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/features/order_payment/order_payment_router.dart';
import '../../data/models/room.dart';
import 'quantity_selector.dart';

class RoomCard extends StatelessWidget {
  final Room room;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const RoomCard({
    super.key,
    required this.room,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.black.withOpacity(0.2),
          width: 0.5,
        ),
      ),
      child: InkWell(
        onTap: () {
          context.push(
            '${OrderPaymentRouter.bookingDetail}?roomId=${room.id}',
          );
        },
        child: Row(
          children: [
          // Room icon with background
          Stack(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
              ),
              Positioned(
                left: 3,
                top: 3,
                child: Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: ClipOval(
                    child: Image.network(
                      room.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          room.icon,
                          size: 24,
                          color: const Color(0xFFFFAA3C),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
          // Room name
          Expanded(
            child: Text(
              room.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
                fontFamily: 'Quicksand',
              ),
            ),
          ),
          // Quantity selector
          QuantitySelector(
            quantity: room.quantity,
            onIncrease: onIncrease,
            onDecrease: onDecrease,
          ),
          ],
        ),
      ),
    );
  }
}

