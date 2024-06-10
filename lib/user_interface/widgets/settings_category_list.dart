import 'package:flutter/material.dart';

class SettingsCategoryList extends StatelessWidget {
  final List<String> categories;
  final ValueChanged<int> onCategorySelected;
  final int selectedIndex;

  const SettingsCategoryList({super.key, 
    required this.categories,
    required this.onCategorySelected,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double itemHeight = constraints.maxHeight * 0.1;

        return ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => onCategorySelected(index),
              child: Container(
                height: itemHeight,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey[300]!),
                    bottom: BorderSide(color: Colors.grey[300]!),
                  ),
                  color: selectedIndex == index ? Colors.blue[50] : Colors.white,
                ),
                child: Center(
                  child: Text(
                    categories[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: selectedIndex == index ? Colors.blue : Colors.black87,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
