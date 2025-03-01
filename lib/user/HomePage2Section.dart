import 'package:flutter/material.dart';

class Homepage2section extends StatefulWidget {  
  const Homepage2section({super.key});

  @override
  State<Homepage2section> createState() => _Homepage2sectionState();
}

class _Homepage2sectionState extends State<Homepage2section> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 5,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 20,
                    child: Icon(Icons.person, color: Colors.black),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "FIND In ",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  Text(
                    "your travel",
                    style: TextStyle(color: Colors.purple, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Icons.location_on, size: 16, color: Colors.black),
                  const SizedBox(width: 5),
                  const Text(
                    "Work - Bengaluru, Karnataka",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  Icon(Icons.keyboard_arrow_down, color: Colors.black),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          // Banner
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.purple.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "₹100 FREE CASH ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Applicable on all stores",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // Select Store Title
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "SELECT OUR SERVICES",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),

          // Store Selection Cards
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildStoreCard(
                  title: "TAXI",
                  subtitle: "For city rides",
                  image: "images/auto1.jpg", // Replace with actual image asset
                  backgroundColor: Colors.purple,
                  textColor: Colors.white,
                  onTap: () {
                    // Navigate to Zepto section
                  },
                ),
                const SizedBox(width: 16),
                _buildStoreCard(
                  //make this center

                  title: "TOURS ",
                  subtitle: "For tours!",
                  image: "assets/super_saver.png", // Replace with actual image asset
                  backgroundColor: Colors.green,
                  textColor: Colors.yellow,
                  onTap: () {
                    // Navigate to Super Saver section
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoreCard({
    required String title,
    required String subtitle,
    required String image,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 220,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: TextStyle(color: textColor, fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Text(subtitle, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 14)),
              const SizedBox(height: 10),
              Image.asset(image, height: 80), // Replace with actual image asset path
              const SizedBox(height: 10),
              const Icon(Icons.arrow_forward, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 20,
                    child: Icon(Icons.person, color: Colors.black),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Delivery In ",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  Text(
                    "9 Mins",
                    style: TextStyle(color: Colors.purple, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Icons.location_on, size: 16, color: Colors.black),
                  const SizedBox(width: 5),
                  const Text(
                    "Work - Bengaluru, Karnataka",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  Icon(Icons.keyboard_arrow_down, color: Colors.black),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          // Banner
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.purple.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "₹100 FREE CASH ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Applicable on all stores",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // Select Store Title
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "SELECT YOUR STORE",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),

          // Store Selection Cards
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildStoreCard(
                  title: "zepto",
                  subtitle: "For your everyday needs",
                  image: "assets/zepto.png", // Replace with actual image asset
                  backgroundColor: Colors.purple,
                  textColor: Colors.white,
                  onTap: () {
                    // Navigate to Zepto section
                  },
                ),
                const SizedBox(width: 16),
                _buildStoreCard(
                  title: "SUPER SAVER",
                  subtitle: "No Delivery Fee! No Surge Fee!",
                  image: "assets/super_saver.png", // Replace with actual image asset
                  backgroundColor: Colors.green,
                  textColor: Colors.yellow,
                  onTap: () {
                    // Navigate to Super Saver section
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoreCard({
    required String title,
    required String subtitle,
    required String image,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 220,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: TextStyle(color: textColor, fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Text(subtitle, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 14)),
              const SizedBox(height: 10),
              Image.asset(image, height: 80), // Replace with actual image asset path
              const SizedBox(height: 10),
              const Icon(Icons.arrow_forward, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }

