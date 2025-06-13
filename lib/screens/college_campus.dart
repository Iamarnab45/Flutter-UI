import 'package:flutter/material.dart';

class CollegeCampus extends StatelessWidget {
  const CollegeCampus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('College Campus'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Explore Our Campus',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Arts and Commerce Campus Section
            _buildCampusSection(
              context,
              'assets/images/download.jpeg',
              'Arts and Commerce Campus',
              'This vibrant section of our college houses the faculties of Arts and Commerce, providing modern classrooms, well-equipped labs, and collaborative spaces designed to foster critical thinking and practical skills for future professionals. It\'s a hub of lively discussions and innovative learning.',
            ),
            const SizedBox(height: 20), // Spacing between sections

            // Science Campus Section
            _buildCampusSection(
              context,
              'assets/images/download(8).jpeg',
              'Science Campus',
              'Our state-of-the-art Science Campus is dedicated to scientific exploration and research. Featuring advanced laboratories, specialized equipment, and dedicated faculty, it offers an immersive environment for students pursuing studies in various scientific disciplines, encouraging hands-on experimentation and discovery.',
            ),
            const SizedBox(height: 20), // Spacing after the last section

            const Text(
              'This section provides a glimpse into our beautiful college campus, showcasing various facilities, green spaces, and academic buildings. We are committed to providing a conducive environment for learning and growth.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build each campus section (image + text)
  Widget _buildCampusSection(BuildContext context, String imagePath, String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.45, // Adjust width to fit beside text
              height: 200, // Fixed height for consistency
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Text(
                        'Image not found',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 20), // Spacing between image and text
            Expanded(
              child: Text(
                description,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ],
    );
  }
}