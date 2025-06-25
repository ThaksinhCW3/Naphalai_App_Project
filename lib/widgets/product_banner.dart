import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/IMG_1540.png', fit: BoxFit.cover),
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              "Lipstick - blah blah...",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 8),
            child: Text("100,000 ₭", style: TextStyle(color: Colors.pink)),
          ),
        ],
      ),
    );
  }
}
