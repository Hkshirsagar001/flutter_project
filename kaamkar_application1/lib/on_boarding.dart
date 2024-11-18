import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();

  final List<Map<String, String>> content = [
    {
      "path": "assets/on_profile1.png",
      "description": "Browse a wide range of trusted professionals for all your home and personal needs."
    },
    {
      "path": "assets/booking.png",
      "description": "With just a few taps, connect with professionals and schedule a time that works for you."
    },
    {
      "path": "assets/review.png",
      "description": "Track your service in real-time, and let us know how it went to help us serve you better!"
    },
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          // color: Colors.teal
          gradient: LinearGradient(
            colors: [   Color(0xffD7CFFE),
              Color(0xff6D60AF),   
            ], // Teal to dark gray gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: content.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 200,
                                    height: 200,
                                    child: Image.asset(
                                      content[index]["path"]!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    content[index]["description"]!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: content.length,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: Colors.black,
                      dotColor: Colors.purple,
                      dotHeight: 12,
                      dotWidth: 12,
                      expansionFactor: 4,
                      spacing: 12,
                    ),
                  ),
                ),
                if (_currentIndex == content.length - 1)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) {
                          return const LoginScreen();
                        }), 
                        (route){ 
                          return false;
                        }
                        );
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // gradient: const LinearGradient(
                          //   colors: [Color(0xFF4ECDC4), Color(0xFF556270)],
                          // ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Center(
                          child: Text(
                            "Get Started",
                            style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Positioned(
              top: 60,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  // Navigate to login page or another page
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder:(context) {
                      return const LoginScreen();
                    },)
                  );
                },
                child: Container(
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color:Colors.white
                    // gradient: const LinearGradient(
                    //   colors: [Color(0xFF4ECDC4), Color(0xFF556270)],
                    // ),
                  ),
                  child: const Center(
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
