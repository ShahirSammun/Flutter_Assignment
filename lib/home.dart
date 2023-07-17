import 'package:flutter/material.dart';

class PortraitLayoutScreen extends StatelessWidget {
  const PortraitLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: screenSize.width / 2,
                  child: CircleAvatar(
                    radius: (screenSize.width / 2),
                    backgroundImage: const NetworkImage(
                        'https://images.pexels.com/photos/13119085/pexels-photo-13119085.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                  ),
                ),
                const Text(
                  'Kawasaki Z1000',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'The Kawasaki Z1000 is a superbike made in Japan by Kawasaki, which has an inline four engine of 998cc with 140bhp at 11000 rpm and 111NM of torque and a top speed of 255kmph.',
            ),
            const SizedBox(
              height: 20,
            ),
            GridView.count(
              physics: const ScrollPhysics(),
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              shrinkWrap: true,
              crossAxisCount: 3,
              children: [
                for (int i = 1; i <= 9; i++)
                  Image.asset(
                      'image/Z1000.jpg',
                      fit: BoxFit.fill),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LandscapeLayoutScreen extends StatelessWidget {
  const LandscapeLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.green,
            radius: screenSize.width / 6,
            child: CircleAvatar(
              radius: (screenSize.width / 6),
              backgroundImage: const NetworkImage(
                  'https://images.pexels.com/photos/13119085/pexels-photo-13119085.jpeg?cs=srgb&dl=pexels-denniz-futalan-13119085.jpg&fm=jpg'),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SingleChildScrollView(
            child: SizedBox(
              width: (screenSize.width) - (screenSize.width / 3) - 26,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Kawasaki Z1000',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'The Kawasaki Z1000 is a superbike made in Japan by Kawasaki, which has an inline four engine of 998cc with 140bhp at 11000 rpm and 111NM of torque and a top speed of 255kmph.',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GridView.count(
                    physics: const ScrollPhysics(),
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    children: [
                      for (int i = 1; i <= 10; i++)
                        Image.asset(
                          'image/Z1000.jpg',
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}