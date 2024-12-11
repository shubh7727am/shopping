import 'package:flutter/material.dart';

class InfoExpansionTile extends StatelessWidget {
  final String aboutText;
  final String washCareText;
  final String serviceText;

  const InfoExpansionTile({super.key,
    required this.aboutText,
    required this.washCareText,
    required this.serviceText,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ExpansionTile(
              title: const Text('About the Product'),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    aboutText,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: const Text('Wash Care Instructions'),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    washCareText,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: const Text('Service & Policy'),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    serviceText,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
