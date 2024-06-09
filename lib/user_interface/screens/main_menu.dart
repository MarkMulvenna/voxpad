import 'package:flutter/material.dart';
import '../widgets/gradient_button.dart';

class GradientButtonScreen extends StatelessWidget {
  final int columns;
  final int rows;

  const GradientButtonScreen({
    super.key,
    required this.columns,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final maxButtonSize = screenWidth < screenHeight ? screenWidth * 0.175 : screenHeight * 0.175;
    final buttonSize = screenWidth / columns < screenHeight / rows ? screenWidth / columns : screenHeight / rows;
    final adjustedButtonSize = buttonSize < maxButtonSize ? buttonSize : maxButtonSize;
    final remainingHorizontalSpace = screenWidth - (adjustedButtonSize * columns);
    final remainingVerticalSpace = screenHeight - (adjustedButtonSize * rows);
    final horizontalPadding = remainingHorizontalSpace / 2;
    final verticalPadding = remainingVerticalSpace / 2;
    const double buttonPadding = 10.0;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'lib/res/background3.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {

              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
            child: GridView.builder(
              padding: const EdgeInsets.all(buttonPadding),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                childAspectRatio: 1.0,
              ),
              itemCount: columns * rows,
              itemBuilder: (context, index) => Center(
                child: GradientButton(
                  gradientColors: const [Colors.pinkAccent, Colors.blueAccent],
                  imagePath: 'lib/res/DiscordLogo.png',
                  labelText: 'Discord',
                  buttonSize: adjustedButtonSize,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
