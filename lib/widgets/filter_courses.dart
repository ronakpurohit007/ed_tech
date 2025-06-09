import 'package:flutter/material.dart';

class FilterBottomSheet extends StatefulWidget {
  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String selectedSkillLevel = 'All';
  String selectedPrice = 'All';

  final List<String> skillLevels = [
    'All',
    'Beginner',
    'Intermediate',
    'Advanced',
    'All Levels',
  ];

  final List<String> prices = [
    'All',
    'Free',
    'Paid',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.50,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filter Courses',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          SizedBox(height: 16),

          // Skill Level Section
          Text(
            'Skill Level',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: skillLevels.map((level) {
              return FilterChip(
                label: Text(level),
                selected: selectedSkillLevel == level,
                onSelected: (_) {
                  setState(() {
                    selectedSkillLevel = level;
                  });
                },
                selectedColor: Colors.blue,
                checkmarkColor: Colors.white,
              );
            }).toList(),
          ),
          SizedBox(height: 24),

          // Price Section
          Text(
            'Price',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: prices.map((price) {
              return FilterChip(
                label: Text(price),
                selected: selectedPrice == price,
                onSelected: (_) {
                  setState(() {
                    selectedPrice = price;
                  });
                },
                selectedColor: Colors.blue,
                checkmarkColor: Colors.white,
              );
            }).toList(),
          ),
          Spacer(),

          // Bottom Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      selectedSkillLevel = 'All';
                      selectedPrice = 'All';
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    side: BorderSide(color: Colors.blue),
                  ),
                  child: Text(
                    'Reset',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, {
                      'skillLevel': selectedSkillLevel,
                      'price': selectedPrice,
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text(
                    'Apply Filters',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
