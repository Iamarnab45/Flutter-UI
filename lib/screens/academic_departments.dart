import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AcademicDepartments extends StatelessWidget {
  const AcademicDepartments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Academic Departments'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // Overall background for the columns
              color: Colors.blue[800], // Lighter blue background
              padding: const EdgeInsets.all(
                15.0,
              ), // Padding inside this main container
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Column 1 - Science Stream
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildDepartmentStreamTitle(
                          'Science Stream Departments',
                        ),
                        _buildDepartmentListItem(context, 'Physics'),
                        _buildDepartmentListItem(context, 'Chemistry'),
                        _buildDepartmentListItem(context, 'Mathematics'),
                        _buildDepartmentListItem(context, 'Computer Science'),
                        _buildDepartmentListItem(context, 'Electronics'),
                        _buildDepartmentListItem(context, 'Microbiology'),
                        _buildDepartmentListItem(context, 'Botany'),
                        _buildDepartmentListItem(context, 'Zoology'),
                        _buildDepartmentListItem(
                          context,
                          'Physiology (Honours & General)',
                        ),
                        _buildDepartmentListItem(
                          context,
                          'Nutrition (General)',
                        ),
                        _buildDepartmentListItem(
                          context,
                          'Economics (Science)',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Column 2 - Arts & Humanities Stream
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildDepartmentStreamTitle(
                          'Arts & Humanities Stream Departments',
                        ),
                        _buildDepartmentListItem(context, 'Bengali'),
                        _buildDepartmentListItem(context, 'English'),
                        _buildDepartmentListItem(context, 'Sanskrit'),
                        _buildDepartmentListItem(context, 'History'),
                        _buildDepartmentListItem(context, 'Political Science'),
                        _buildDepartmentListItem(context, 'Philosophy'),
                        _buildDepartmentListItem(context, 'Education'),
                        _buildDepartmentListItem(context, 'Sociology'),
                        _buildDepartmentListItem(context, 'Geography'),
                        _buildDepartmentListItem(
                          context,
                          'Journalism & Mass Communication',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Column 3 - Commerce & Postgraduate Departments
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildDepartmentStreamTitle(
                          'Commerce Stream Departments',
                        ),
                        _buildDepartmentListItem(
                          context,
                          'Commerce (Accountancy, Finance, Business Studies, etc.)',
                        ),
                        const SizedBox(
                          height: 20,
                        ), // Spacing between sections in this column
                        _buildDepartmentStreamTitle('Postgraduate Departments'),
                        _buildDepartmentListItem(context, 'M.A. in Bengali'),
                        _buildDepartmentListItem(context, 'M.A. in English'),
                        _buildDepartmentListItem(context, 'M.A. in History'),
                        _buildDepartmentListItem(
                          context,
                          'M.Sc. in Mathematics',
                        ),
                        _buildDepartmentListItem(
                          context,
                          'M.Sc. in Microbiology',
                        ),
                        _buildDepartmentListItem(
                          context,
                          'M.Sc. in Computer Science',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30), // Spacing after the columns
            Image.asset(
              'assets/images/student.jpg',
              fit:
                  BoxFit.contain, // Changed from BoxFit.cover to BoxFit.contain
              width: double.infinity, // Make it span the full width
              height: 200, // Adjust height as needed
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: const Center(child: Text('Students Image Not Found')),
                );
              },
            ),
            const SizedBox(height: 30), // Spacing after the image
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Faculty Council for Post-Graduate Studies in Science',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'At Barrackpore Rastraguru Surendranath College (BRSN College), the Faculty Council for Post-Graduate Studies in Science oversees the academic and administrative aspects of the postgraduate (PG) science programs. Here are the key details regarding this body:',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                const SizedBox(height: 20),
                const Text(
                  '1. Structure of the Faculty Council for PG Studies in Science',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
                _buildBulletPoint(
                  'Chairman: Usually the Principal of the college.',
                ),
                _buildBulletPoint(
                  'Heads of PG Science Departments (e.g., Mathematics, Microbiology, etc.).',
                ),
                _buildBulletPoint(
                  'Senior Faculty Members from PG departments.',
                ),
                _buildBulletPoint(
                  'University Nominees (from West Bengal State University - WBSU).',
                ),
                _buildBulletPoint(
                  'External Experts (subject specialists, if required).',
                ),
                const SizedBox(height: 20),
                const Text(
                  '2. Functions & Responsibilities',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
                _buildBulletPoint(
                  'Approving PG course syllabi (as per WBSU guidelines).',
                ),
                _buildBulletPoint(
                  'Conducting examinations, evaluations, and result declarations.',
                ),
                _buildBulletPoint(
                  'Addressing student grievances related to academics.',
                ),
                _buildBulletPoint(
                  'Organizing seminars, workshops, and research initiatives.',
                ),
                _buildBulletPoint(
                  'Ensuring UGC & WBSU compliance for PG programs.',
                ),
                const SizedBox(height: 20),
                const Text(
                  '3. PG Science Departments Under the Council',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
                _buildBulletPoint('M.Sc. in Mathematics'),
                _buildBulletPoint('M.Sc. in Microbiology'),
                _buildBulletPoint('M.Sc. in Computer Science'),
                _buildBulletPoint(
                  '(Other PG courses like M.A. in Bengali, English, and History fall under the Faculty Council for Arts & Commerce.)',
                ),
                const SizedBox(height: 20),
                const Text(
                  '4. Affiliation & Approval',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
                _buildBulletPoint(
                  'The PG programs are affiliated with West Bengal State University (WBSU).',
                ),
                _buildBulletPoint(
                  'The college follows UGC guidelines for PG education.',
                ),
                const SizedBox(height: 20),
                const Text(
                  '5. Contact for Further Details',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
                _buildClickableBulletPoint(
                  context,
                  'Visit the college website: ',
                  'https://brsnc.in/#',
                ),
                _buildBulletPoint(
                  'Contact the PG Department Coordinators or the College Administration.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.circle, size: 8, color: Colors.black87),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClickableBulletPoint(
    BuildContext context,
    String displayTextPrefix,
    String urlString,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.circle, size: 8, color: Colors.black87),
          const SizedBox(width: 10),
          Text(
            displayTextPrefix,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () async {
                final Uri url = Uri.parse(urlString);
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: Text(
                urlString,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDepartmentStreamTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white, // Title color for dark background
        ),
      ),
    );
  }

  Widget _buildDepartmentListItem(BuildContext context, String title) {
    return TextButton(
      onPressed: () {
        // TODO: Implement navigation for each specific item
        print('$title pressed on Academic Departments page!');
      },
      style: TextButton.styleFrom(
        backgroundColor:
            Colors.transparent, // Ensure transparent background for list item
        foregroundColor: Colors.white, // White text and bullet
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 10,
        ), // Adjusted horizontal padding
        alignment: Alignment.centerLeft, // Align content to left
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.circle,
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
