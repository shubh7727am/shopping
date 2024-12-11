import 'package:flutter/material.dart';


class AvailableColorsWidget extends StatefulWidget {
  final List<Color> colors;

  const AvailableColorsWidget({super.key, required this.colors});

  @override
  _AvailableColorsWidgetState createState() => _AvailableColorsWidgetState();
}

class _AvailableColorsWidgetState extends State<AvailableColorsWidget> {
  int selectedIndex = 0; // Keeps track of the selected color index

  @override
  Widget build(BuildContext context) {

    return Row(
      children: widget.colors.asMap().entries.map((entry) {
        int index = entry.key;
        Color color = entry.value;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index; // Update the selected index
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: CircleAvatar(
              backgroundColor: color,
              radius: 16,
              child: selectedIndex == index
                  ? const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16,
                    )
                  : null,
            ),
          ),
        );
      }).toList(),
    );
  }
}
