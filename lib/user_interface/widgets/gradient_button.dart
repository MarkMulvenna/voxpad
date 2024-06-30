import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final List<Color> gradientColors;
  final String imagePath;
  final String labelText;
  final double buttonSize;

  const GradientButton({
    super.key,
    required this.gradientColors,
    required this.imagePath,
    required this.labelText,
    required this.buttonSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonSize * .9,
      height: buttonSize * .9,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          stops: const [0.0, 1.0], // Stops for the gradient
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8.0), // Adjust border radius as needed
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  imagePath,
                  width: buttonSize * 0.6, // Adjust image size based on buttonSize
                  height: buttonSize * 0.6,
                ),
                const SizedBox(height: 8.0), // Adjust spacing between image and text
                Text(
                  labelText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0, // Adjust font size as needed
                    fontWeight: FontWeight.bold, // Adjust font weight as needed
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
