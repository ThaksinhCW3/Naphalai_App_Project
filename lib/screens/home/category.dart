import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int selectedCategory = 0;

  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.remove_red_eye, 'label': 'Mascara'},
    {'icon': Icons.face, 'label': 'Lipstick'}, // Use a similar built-in icon
    {'icon': Icons.spa, 'label': 'Perfume'}, // Replace with custom icon
    {'icon': Icons.brush, 'label': 'Brush'},
  ];

  final List<Map<String, String>> products = [
    {'image': 'assets/images/mascara1.png', 'name': 'Classic'},
    {'image': 'assets/images/mascara2.png', 'name': 'Hourglass'},
    {'image': 'assets/images/mascara3.png', 'name': 'Comb'},
    {'image': 'assets/images/mascara4.png', 'name': 'Curved'},
    {'image': 'assets/images/mascara5.png', 'name': 'Oval'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green[600],
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   title: Text('Category', style: TextStyle(color: Colors.white70)),
      // ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'ຄົ້ນຫາ...',
                  prefixIcon: Icon(Icons.search, color: Colors.pink),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 20,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.pinkAccent, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.pink, width: 2),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  // Category Selector
                  SizedBox(
                    width: 90,
                    child: ListView.builder(
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        bool isSelected = selectedCategory == index;
                        return GestureDetector(
                          onTap: () => setState(() => selectedCategory = index),
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 8,
                            ),
                            padding: EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color:
                                  isSelected ? Colors.pink[100] : Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow:
                                  isSelected
                                      ? [
                                        BoxShadow(
                                          color: Colors.pink[100]!,
                                          blurRadius: 8,
                                        ),
                                      ]
                                      : [],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  categories[index]['icon'],
                                  color:
                                      isSelected ? Colors.pink : Colors.black,
                                  size: 32,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  categories[index]['label'],
                                  style: TextStyle(
                                    color:
                                        isSelected ? Colors.pink : Colors.black,
                                    fontWeight:
                                        isSelected
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Product Grid
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.all(16),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Image.asset(
                                  products[index]['image']!,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                products[index]['name']!,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
