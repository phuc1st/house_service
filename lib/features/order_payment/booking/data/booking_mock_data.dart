import 'package:flutter/material.dart';
import 'models/room.dart';
import 'models/service.dart';

final Service mockService = Service(
  id: '1',
  name: 'Dọn dẹp nhà cửa',
  orderId: '#8843-2551',
  avatarUrl: 'https://www.figma.com/api/mcp/asset/ecdb8a69-6add-4990-bbd5-4b339e7736ad',
);

final List<Room> mockRooms = [
  Room(
    id: '1',
    name: 'Phòng khách',
    icon: Icons.chair,
    imageUrl: 'https://www.figma.com/api/mcp/asset/d6bc1cde-d02e-4ef9-8bcf-f5df8e584e66',
    quantity: 1,
  ),
  Room(
    id: '2',
    name: 'Phòng tắm',
    icon: Icons.bathtub,
    imageUrl: 'https://www.figma.com/api/mcp/asset/411995ec-3116-42d5-b79e-f9ddf97d091a',
    quantity: 1,
  ),
  Room(
    id: '3',
    name: 'Phòng ngủ',
    icon: Icons.bed,
    imageUrl: 'https://www.figma.com/api/mcp/asset/bd017d2c-4038-4e03-9f33-1f37ffa7c04f',
    quantity: 1,
  ),
  Room(
    id: '4',
    name: 'Phòng bếp',
    icon: Icons.kitchen,
    imageUrl: 'https://www.figma.com/api/mcp/asset/3b65dd5a-91e8-477d-8242-e45c44194afa',
    quantity: 1,
  ),
  Room(
    id: '5',
    name: 'Phòng ăn',
    icon: Icons.restaurant,
    imageUrl: 'https://www.figma.com/api/mcp/asset/aa4de262-4d45-40f5-bbc2-75d3c4f5466a',
    quantity: 1,
  ),
  Room(
    id: '6',
    name: 'Nơi để xe',
    icon: Icons.local_parking,
    imageUrl: 'https://www.figma.com/api/mcp/asset/630c4e54-ae8d-4cde-8143-958fa59418ed',
    quantity: 1,
  ),
  Room(
    id: '7',
    name: 'Sân thượng',
    icon: Icons.deck,
    imageUrl: 'https://www.figma.com/api/mcp/asset/d1b35393-a3db-40f8-ae74-6682eb90687c',
    quantity: 1,
  ),
];

