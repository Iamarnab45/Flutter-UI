import 'package:flutter/material.dart';
import 'screens/about_college.dart';
import 'screens/academic_departments.dart';
import 'screens/convocation.dart';
import 'screens/login_page.dart';
import 'screens/registration_page.dart';
import 'screens/donation_page.dart';
import 'screens/college_campus.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const AlumniApp());
}

class AlumniApp extends StatelessWidget {
  const AlumniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barrackpore Rastraguru Surendranath College',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Expanded(
          child: const Text(
            'Alumni Association of Barrackpore Rastraguru Surendranath College',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () async {
            final Uri url = Uri.parse('https://brsnc.in/');
            if (!await launchUrl(url)) {
              throw Exception('Could could launch $url');
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/college_logo.png',
              fit: BoxFit.contain,
              height: 40,
              width: 40,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.school, color: Colors.white);
              },
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // College Image Banner
            Container(
              width: double.infinity,
              height: 300,
              color: Colors.grey[300],
              child: Image.asset(
                'assets/images/college_banner.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Text(
                      'College Image Banner',
                      style: TextStyle(fontSize: 24),
                    ),
                  );
                },
              ),
            ),
            // Navigation Menu
            Container(
              width: double.infinity,
              color: Colors.blue[50],
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  // Navigation Items
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildNavItem(
                            context,
                            'About the College',
                            const AboutCollege(),
                          ),
                          _buildNavItem(
                            context,
                            'Departments',
                            const AcademicDepartments(),
                          ),
                          _buildNavItem(
                            context,
                            'Convocation',
                            const Convocation(),
                          ),
                          _buildNavItem(
                            context,
                            'College Library',
                            Container(),
                          ),
                          _buildNavItem(
                            context,
                            'Student Union',
                            Container(),
                          ),
                          _buildNavItem(
                            context,
                            'Donation',
                            const DonationPage(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Login Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.blue, // Blue background to match Join Now
                        foregroundColor: Colors.white, // White text color
                      ),
                      child: const Text('Login'), // Login text instead of icon
                    ),
                  ),
                  // Join Now Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegistrationPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Violet background
                        foregroundColor: Colors.white, // White text color
                      ),
                      child: const Text('Join Now'),
                    ),
                  ),
                ],
              ),
            ),
            // Main Content
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 20.0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1, // Changed from flex: 2 to flex: 1
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Some Distinguished Alumni of Barrackpore Rastraguru Surendranath College',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        SizedBox(height: 10),
                        // Image for distinguished alumni
                        Image.asset(
                          'assets/images/home.jpg',
                          fit: BoxFit.contain,
                          height: 200, // Adjust height as needed
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                              child: const Text(
                                'Image not found',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.red,
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 10),
                        // Placeholder text for distinguished alumni
                        Text(
                          '''Barrackpore Rastraguru Surendranath College (formerly Barrackpore College) has a proud legacy of nurturing talented individuals who have gone on to excel in diverse fields such as politics, academia, civil services, literature, and social work. Over the decades, the institution has contributed to shaping leaders, thinkers, and professionals who have made significant contributions to society.
''',
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Notable Alumni Contributions',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '''Public Service & Administration: Many alumni have served in prestigious roles, including IAS, IPS, and WBCS officers, contributing to governance and public welfare.

Academic Excellence: Several graduates have become respected professors, researchers, and scientists, enriching education and innovation.

Cultural & Literary Influence: The college has produced writers, poets, and artists who have contributed to Bengali literature and cultural movements.

Social Leadership: Alumni have been involved in social activism, NGOs, and community development, driving positive change in West Bengal and beyond.

While specific high-profile names may not be widely documented, the college takes pride in its alumni network, which continues to uphold the institution's values of knowledge, integrity, and service.''',
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                        SizedBox(height: 20),
                        // More content for left column will go here
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1, // Remains flex: 1 for equal distribution
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildListNavItem(
                          context,
                          'About the College',
                          const AboutCollege(),
                        ),
                        _buildListNavItem(
                          context,
                          'College Campus',
                          const CollegeCampus(),
                        ),
                        _buildListNavItem(
                          context,
                          'Academic Departments',
                          const AcademicDepartments(),
                        ),
                        _buildListNavItem(
                          context,
                          'Convocation',
                          const Convocation(),
                        ),
                        _buildListNavItem(
                          context,
                          'College Library',
                          Container(),
                        ),
                        _buildListNavItem(
                          context,
                          'Student Union',
                          Container(),
                        ),
                        _buildListNavItem(
                          context,
                          'Distinguished Teachers',
                          Container(),
                        ),
                        SizedBox(height: 30), // Increased padding
                        // New image added in the right column
                        Image.asset(
                          'assets/images/images.jpg',
                          fit: BoxFit.contain,
                          height: 250, // Increased height
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                              child: const Text(
                                'Image not found',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.red,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
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

  Future<void> _launchLibraryURL() async {
    final Uri url = Uri.parse('https://brsnc.in/site/library');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _launchStudentUnionURL() async {
    final Uri url = Uri.parse('https://brsnc.in/site/page_content/58');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _launchDistinguishedTeachersURL() async {
    final Uri url = Uri.parse('https://brsnc.in/site/ug_staff');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Widget _buildNavItem(BuildContext context, String title, Widget page) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: TextButton(
        onPressed: () {
          if (title == 'College Library') {
            _launchLibraryURL();
          } else if (title == 'Student Union') {
            _launchStudentUnionURL();
          } else if (title == 'Distinguished Teachers') {
            _launchDistinguishedTeachersURL();
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          }
        },
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildContentSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          Text(content, style: const TextStyle(fontSize: 16)),
          const Divider(),
        ],
      ),
    );
  }

  Widget _buildListNavItem(BuildContext context, String title, Widget page) {
    return TextButton(
      onPressed: () {
        if (title == 'College Library') {
          _launchLibraryURL();
        } else if (title == 'Student Union') {
          _launchStudentUnionURL();
        } else if (title == 'Distinguished Teachers') {
          _launchDistinguishedTeachersURL();
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (context) => page));
        }
      },
      style: TextButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
