import 'package:flutter/material.dart';

class Convocation extends StatelessWidget {
  const Convocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Convocation'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Convocation Ceremonies',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Grid of images
            Wrap(
              spacing: 10, // horizontal spacing
              runSpacing: 10, // vertical spacing
              children: [
                for (int i = 0; i <= 29; i++)
                  SizedBox(
                    width: (MediaQuery.of(context).size.width - 70) / 3, // 70 accounts for padding and spacing between 3 images
                    height: 200, // fixed height for consistency
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/$i.jpg',
                        fit: BoxFit.cover,
                      ),
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