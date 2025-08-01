import 'package:flutter/material.dart';
import 'package:job/Dashboard.dart';
import 'package:job/LoginPage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              _controller.jumpToPage(2); // Skip to last page
            },
            child: GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DashboardPage()));
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  color: Colors.black26,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  isLastPage = index == 2;
                });
              },
              children: [
                buildPage(
                  imagePath: 'assets/images/img1.png',
                  title: 'All business solutions',
                  description:
                  'This system helps you improve your operations \nfor your customers',
                ),
                buildPage(
                  imagePath: 'assets/images/img1.png',
                  title: 'Fast & Secure',
                  description:
                  'Track everything in real time and keep \n your data safe',
                ),
                buildPage(
                  imagePath: 'assets/images/img1.png',
                  title: 'Easy to Use',
                  description:
                  'Simple interface for staff and customers to \n interact easily',
                ),
              ],
            ),
          ),

          // Dot Indicator
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: ExpandingDotsEffect(
              dotHeight: 8,
              dotWidth: 12,
              expansionFactor: 2,
              spacing: 8,
              dotColor: Colors.deepPurple.shade100,
              activeDotColor: Colors.purple,
            ),
          ),

          const SizedBox(height: 30),

          // Bottom Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {
                  if (isLastPage==true) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Loginpage()));
                    // print('Get Started Clicked');
                  } else {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Text(
                  isLastPage ? 'Get Started' : 'Next',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage({
    required String imagePath,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Image.asset(imagePath, height: 280),
          const SizedBox(height: 40),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(
              color: Colors.black45,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
