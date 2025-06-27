import 'package:flutter/material.dart';

/// A widget that displays property information in a visually appealing card.
///
/// This card features a prominent image at the top and a styled content
/// section at the bottom with details about the property.
class PropertyCard extends StatelessWidget {
  const PropertyCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Using a Container to set a specific width for the card for demonstration.
    // In a real app, this might be controlled by a GridView or ListView.
    return SizedBox(
      width: 350, // Example width, adjust as needed
      child: Card(
        // The main card's background color, shadow, and shape
        color: const Color(
          0xFFBCA995,
        ), // An approximation of the card's brownish color
        elevation: 4.0,
        shadowColor: Colors.black.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        clipBehavior: Clip
            .antiAlias, // Ensures the children conform to the card's rounded corners
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize
              .min, // The column should only be as tall as its content
          children: [
            // 1. Image Section
            Image.asset(
              'assets/images/apartment_plan.png', // IMPORTANT: Replace with your actual image path
              height: 250, // Define a height for the image
              fit: BoxFit.cover,
            ),

            // 2. Content Section
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: const Color(
                  0xFF2D2D2D,
                ), // The dark background for the text content
                borderRadius: BorderRadius.circular(
                  20.0,
                ), // Rounded corners for this container
              ),
              child: Column(
                // Align text to the left
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title Text - Centered
                  Center(
                    child: Text(
                      'Дом 1',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ), // Spacing between title and details
                  // Details Text
                  Text(
                    'Адрес: Ул. Энгельса дом 18',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 8.0), // Spacing between details

                  Text(
                    'Площадь: 115 м²',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 8.0),

                  Text(
                    'Кол-во комнат: 4',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.8),
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
