import 'package:flutter/material.dart';
import 'package:naphalai_e/widgets/product_banner.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';

final List<String> images = [
  'https://picsum.photos/400/200?image=1',
  'https://picsum.photos/400/200?image=2',
  'https://picsum.photos/400/200?image=3',
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselSliderController globalCarouselController =
      CarouselSliderController();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. App Header Row
              Row(
                children: [
                  Text("Home", style: Theme.of(context).textTheme.titleLarge),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.notifications),
                    onPressed: () {},
                  ),
                  IconButton(icon: const Icon(Icons.search), onPressed: () {}),
                ],
              ),

              const SizedBox(height: 12),

              // 2. Carousel Slider
              CarouselSlider(
                items:
                    images
                        .map(
                          (imgUrl) => Container(
                            margin: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(imgUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                        .toList(), // List of image widgets
                controller: globalCarouselController,
                options: CarouselOptions(
                  autoPlay: true,
                  height: 200,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),

              const SizedBox(height: 14),

              // 3. Product Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 8, // or however many products
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (context, index) {
                  return ProductCard();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
