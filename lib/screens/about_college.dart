import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutCollege extends StatelessWidget {
  const AboutCollege({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () async {
            final Uri url = Uri.parse('https://brsnc.in/');
            if (!await launchUrl(url)) {
              throw Exception('Could not launch $url');
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/logo.png',
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.school, color: Colors.white);
              },
            ),
          ),
        ),
        title: const Text('About the College'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              // Overall background for the three columns
              color:
                  Colors
                      .blue[900], // Dark blue to match the reference image's section background
              padding: const EdgeInsets.all(
                15.0,
              ), // Padding inside this main container
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Column 1
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Re-added space between items
                        _buildAboutCollegeListItem(context, 'College Song'),
                        const SizedBox(
                          height: 5,
                        ), // Re-added space between items
                        _buildAboutCollegeListItem(
                          context,
                          'Seals of the University',
                        ),
                        const SizedBox(
                          height: 5,
                        ), // Re-added space between items
                        _buildAboutCollegeListItem(
                          context,
                          'Heritage Buildings',
                        ),
                        const SizedBox(
                          height: 5,
                        ), // Re-added space between items
                        _buildAboutCollegeListItem(context, 'Notable Firsts'),
                        const SizedBox(
                          height: 5,
                        ), // Re-added space between items
                        _buildAboutCollegeListItem(context, 'Nobel Laureates'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Column 2
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildAboutCollegeListItem(
                          context,
                          'Distinguished Alumni',
                        ),
                        const SizedBox(
                          height: 5,
                        ), // Re-added space between items
                        _buildAboutCollegeListItem(
                          context,
                          'Distinguished Teachers',
                        ),
                        const SizedBox(
                          height: 5,
                        ), // Re-added space between items
                        _buildAboutCollegeListItem(context, 'Honoris Causa'),
                        const SizedBox(
                          height: 5,
                        ), // Re-added space between items
                        _buildAboutCollegeListItem(context, 'Scholarships'),
                        const SizedBox(
                          height: 5,
                        ), // Re-added space between items
                        _buildAboutCollegeListItem(
                          context,
                          'Eminent Teacher Awards (1998 - 2020)',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Column 3
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildAboutCollegeListItem(
                          context,
                          'Endowment Lectures/Medals/Scholarships/Fellowship/Chairs of Excellence',
                        ),
                        const SizedBox(
                          height: 5,
                        ), // Re-added space between items
                        _buildAboutCollegeListItem(
                          context,
                          'Down memory lane: some of our Earliest Affiliated Colleges',
                        ),
                        const SizedBox(
                          height: 5,
                        ), // Re-added space between items
                        _buildAboutCollegeListItem(
                          context,
                          'Down memory lane: Glimpses of some of the Departments of the University',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ), // This closes the original Container
            // New Content Section: Text and Images Side-by-Side
            const SizedBox(height: 30), // Space after the three-column section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Foundation of Barrackpore Rastraguru Surendranath College',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Barrackpore Rastraguru Surendranath College was founded in 1953 by a group of dedicated individuals, led by Dr. Satish Bose, a prominent social worker. The college was named after Surendranath Banerjei, a renowned figure from Barrackpore and India. Initially, it functioned from Debiprasad High School and later moved to 6 Riverside Road, affiliated with the University of Calcutta. In 1969, the college acquired a plot of land at 85 Middle Road for further expansion.',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 15), // Spacing before the address
                          Text(
                            'Address: 6, Riverside Road, Barrackpore, Kolkata - 700120',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 1,
                      child: Image.asset(
                        'assets/images/about_college.jpg', // First campus image
                        fit: BoxFit.cover,
                        height: 200, // Maintain placeholder height
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 200,
                            color: Colors.grey[300],
                            child: const Center(child: Text('Image Not Found')),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20), // Spacing before the image
                GestureDetector(
                  onTap: () async {
                    final Uri url = Uri.parse(
                      'https://www.google.com/maps/place/Barrackpore+Rastraguru+Surendranath+College,+6,+River+Side+Rd,+Cantonment,+Kolkata,+Barrackpur+Cantonment,+West+Bengal+700120,+India/@22.76412,88.355483,15z/data=!4m6!3m5!1s0x39f896ccfe555557:0x3d78ac3af6a4caa4!8m2!3d22.7641195!4d88.3554835!16s%2Fm%2F0j29tp8?hl=en-GB&gl=US&utm_campaign=ml-ardl&g_ep=Eg1tbF8yMDI1MDYwOV8wIOC7DCoASAJQAQ%3D%3D',
                    );
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                  child: Image.asset(
                    'assets/images/location.jpg',
                    fit: BoxFit.contain, // Adjust fit as needed
                    height: 200, // Adjust height as needed
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Text(
                          'Location Image not found',
                          style: TextStyle(fontSize: 18, color: Colors.red),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30), // Spacing after the first section
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
          ], // This closes the main Column's children
        ), // This closes the main Column
      ),
    );
  }

  // Helper method to build each campus section (image + text)
  Widget _buildCampusSection(
    BuildContext context,
    String imagePath,
    String title,
    String description,
  ) {
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
              width:
                  MediaQuery.of(context).size.width *
                  0.45, // Adjust width to fit beside text
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
                        style: TextStyle(fontSize: 18, color: Colors.red),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 20), // Spacing between image and text
            Expanded(
              child: Text(description, style: const TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAboutCollegeListItem(BuildContext context, String title) {
    return TextButton(
      onPressed: () {
        // TODO: Implement navigation for each specific item
        print('$title pressed on AboutCollege page!');
      },
      style: TextButton.styleFrom(
        backgroundColor:
            Colors.transparent, // Ensure transparent background for list item
        foregroundColor: Colors.white, // White text and bullet
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        alignment: Alignment.centerLeft, // Align content to left
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.circle_sharp,
            size: 8,
            color: Colors.white,
          ), // Bullet point icon
          const SizedBox(width: 10), // Space between bullet and text
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
