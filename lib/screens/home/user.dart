import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[600],
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          children: [
            // Header with pink background
            Container(
              decoration: BoxDecoration(color: Colors.pink[200]),
              padding: const EdgeInsets.only(
                top: 32,
                left: 24,
                right: 24,
                bottom: 16,
              ),
              child: Column(
                children: [
                  // Top row: avatar, name, bell, settings
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Avatar with edit icon
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 38,
                            backgroundImage: NetworkImage(
                              'https://i.pinimg.com/originals/2e/2d/2e2d2e2d2e2d2e2d2e2d2e2d2e2d2e2d.jpg',
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 13,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.edit,
                                size: 16,
                                color: Colors.pink[300],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      // Name and vertical divider
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            const Text(
                              'Dante888',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Bell and settings
                      Column(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.notifications_none,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.settings,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Row of 3 buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _profileButton(Icons.favorite_border, 'ຕັ້ງຄ່າທີ່ຮັກ'),
                      _profileButton(Icons.percent, 'ຄູປອງ'),
                      _profileButton(Icons.home_outlined, 'ບ້ານຂ້ອຍ'),
                    ],
                  ),
                ],
              ),
            ),
            // Section: Order status
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                children: const [
                  Text(
                    'ຄຳສັ່ງຊື້ຂອງຂ້ອຍ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Spacer(),
                  Text(
                    'ເບິ່ງປະຫວັດການສັ່ງຊື້ →',
                    style: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ],
              ),
            ),
            // Order status icons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _orderStatus(Icons.payment, 'ທີ່ຕ້ອງຊຳລະ'),
                  _orderStatus(Icons.inventory_2, 'ທີ່ຕ້ອງຈັດສົ່ງ'),
                  _orderStatus(Icons.local_shipping, 'ທີ່ຕ້ອງໄດ້ຮັບ'),
                  _orderStatus(Icons.star_border, 'ມອບຄະແນນ'),
                  _orderStatus(Icons.attach_money, 'ຮັບເງິນ'),
                ],
              ),
            ),
            // Fill remaining space
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }

  Widget _profileButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: Colors.white,
          child: Icon(icon, color: Colors.pink[300], size: 26),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 13, color: Colors.black)),
      ],
    );
  }

  Widget _orderStatus(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 32, color: Colors.black),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
