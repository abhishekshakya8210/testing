import 'package:flutter/material.dart';

class Instagram extends StatefulWidget {
  const Instagram({super.key});

  @override
  State<Instagram> createState() => _InstagramState();
}

class _InstagramState extends State<Instagram> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Instagram',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: const [
          Icon(Icons.favorite_border_outlined, color: Colors.white, size: 27),
          SizedBox(width: 20),
          Icon(Icons.message, color: Colors.white, size: 27),
          SizedBox(width: 10),
        ],
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          // ✅ Stories Section
          SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Name',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    )
                  ],
                );
              },
            ),
          ),

          // ✅ Posts Section
          ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Row
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Paradox boy',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      const Spacer(), // ✅ replaces hardcoded SizedBox(width: 150)
                      const Icon(Icons.more_vert, size: 28, color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Post Image
                  Container(
                    height: 350,
                    width: double.infinity,
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 20),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
