import 'package:flutter/material.dart';

class SizeChoice extends StatefulWidget {
  final List<String> sizes;  // List of sizes to display as chips
  final ValueChanged<String> onSizeSelected; // Callback when size selection changes

  const SizeChoice({super.key, required this.sizes, required this.onSizeSelected});

  @override
  _SizeChoiceState createState() => _SizeChoiceState();
}

class _SizeChoiceState extends State<SizeChoice> {
  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.sizes.map((size) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: ChoiceChip(
            label: Text(size),
            selected: size == selectedSize,
            selectedColor: Colors.white,
            backgroundColor: Colors.white70,
            side: BorderSide(
              color: size == selectedSize ? Colors.black : Colors.grey,
              width: 1.5, // Adjust border thickness
            ),
            onSelected: (bool isSelected) {
              if (isSelected) {
                setState(() {
                  selectedSize = size;
                });
                widget.onSizeSelected(size); // Notify the parent widget
              }
            },
          ),
        );
      }).toList(),
    );
  }
}
