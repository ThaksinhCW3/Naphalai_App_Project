import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<bool> checked = [false, false, false];
  int quantity1 = 1, quantity2 = 1, quantity3 = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green[600],
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   title: const Text('Cart', style: TextStyle(color: Colors.white70)),
      //   automaticallyImplyLeading: false,
      // ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          children: [
            // Header with search and actions
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(color: Colors.pink[100]),
              child: Row(
                children: [
                  const Text(
                    'ກະຕ່າ (6)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'ຄົ້ນຫາສິນຄ້າໃນກະຕ່າ...',
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.pink[200],
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'ຈັດການ',
                    style: TextStyle(
                      color: Colors.pink[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Cart items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                children: [
                  _cartSection(
                    checked: checked[0],
                    onChecked: (v) => setState(() => checked[0] = v!),
                    store: 'Kojome Production',
                    image: 'assets/images/mascara1.png',
                    title: 'Placeholder',
                    subtitle: 'ແປ້ງຫນ້າເຈົ້າ, ບຣັດຊ໌',
                    price: '200,000 K',
                    quantity: quantity1,
                    onAdd: () => setState(() => quantity1++),
                    onRemove:
                        () => setState(
                          () => quantity1 = quantity1 > 1 ? quantity1 - 1 : 1,
                        ),
                  ),
                  _cartSection(
                    checked: checked[1],
                    onChecked: (v) => setState(() => checked[1] = v!),
                    store: 'CAPCOM Unofficial',
                    image: 'assets/images/mascara2.png',
                    title: 'Placeholder',
                    subtitle: '4K,144fps',
                    price: '200,000 K',
                    quantity: quantity2,
                    onAdd: () => setState(() => quantity2++),
                    onRemove:
                        () => setState(
                          () => quantity2 = quantity2 > 1 ? quantity2 - 1 : 1,
                        ),
                  ),
                  _cartSection(
                    checked: checked[2],
                    onChecked: (v) => setState(() => checked[2] = v!),
                    store: 'WW Playgrounds',
                    image: 'assets/images/IMG_1540.png',
                    title: 'Placeholder',
                    subtitle: 'ອິນນາວ',
                    price: '200,000 K',
                    quantity: quantity3,
                    onAdd: () => setState(() => quantity3++),
                    onRemove:
                        () => setState(
                          () => quantity3 = quantity3 > 1 ? quantity3 - 1 : 1,
                        ),
                  ),
                ],
              ),
            ),
            // Bottom bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.08),
                    blurRadius: 8,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: checked.every((c) => c),
                    onChanged: (v) => setState(() => checked = [v!, v, v]),
                  ),
                  const Text('ເລືອກທັງຫມົດ'),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        'ຍອດລວມ: 0.00 K',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ສ່ວນຫຼຸດ: 0.00 K',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[200],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('ສັ່ງຊື້'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cartSection({
    required bool checked,
    required ValueChanged<bool?> onChecked,
    required String store,
    required String image,
    required String title,
    required String subtitle,
    required String price,
    required int quantity,
    required VoidCallback onAdd,
    required VoidCallback onRemove,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[300]!),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.07),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Store row
          Row(
            children: [
              Checkbox(value: checked, onChanged: onChecked),
              Icon(Icons.store, color: Colors.black54, size: 20),
              const SizedBox(width: 4),
              Text(store, style: const TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              const Icon(Icons.chevron_right, size: 20),
            ],
          ),
          const Divider(),
          // Product row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(image, width: 60, height: 60, fit: BoxFit.contain),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      price,
                      style: const TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Quantity controls
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove, size: 18),
                    onPressed: onRemove,
                  ),
                  Text(
                    '$quantity',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, size: 18),
                    onPressed: onAdd,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
