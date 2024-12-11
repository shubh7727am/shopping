import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselWithIndicators extends StatefulWidget {
  final List<String> imageUrls;
  final double height;
  final double width;
  final String ratingText;

  const CarouselWithIndicators({
    super.key,
    required this.imageUrls,
    this.height = 500.0,
    this.width = 500.0,
    this.ratingText = "",
  });

  @override
  _CarouselWithIndicatorsState createState() => _CarouselWithIndicatorsState();
}

class _CarouselWithIndicatorsState extends State<CarouselWithIndicators> {
  int currentIndex = 0;

  void _onDotTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Carousel Slider
        Center(
          child: SizedBox(
            width: widget.width, // Set the desired width
            height: widget.height, // Set the desired height
            child: Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: widget.height,
                    autoPlay: true, // Auto slide
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                  items: widget.imageUrls.map((url) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.shade200,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              url,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Center(
                                  child: Text('Image failed to load'),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                if (widget.ratingText.isNotEmpty)
                  Positioned(
                    bottom: 40,
                    left: 40,
                    child: Container(
                      width: 150,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(widget.ratingText),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),

        // Dot indicators
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imageUrls.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _onDotTap(entry.key),
              child: Container(
                width: currentIndex == entry.key ? 12.0 : 8.0,
                height: currentIndex == entry.key ? 12.0 : 8.0,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == entry.key
                      ? Colors.pink
                      : Colors.grey,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}