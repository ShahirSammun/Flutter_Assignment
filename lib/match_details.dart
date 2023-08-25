import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class MatchDetailsScreen extends StatelessWidget {
  final String matchName, matchId;

  const MatchDetailsScreen(
      {Key? key, required this.matchName, required this.matchId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(matchName),
      ),
      body: Column(
        children: [
          StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Argentina vs Brazil')
                .doc(matchId)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final item = snapshot.data;
                return Card(
                  margin: const EdgeInsets.all(16),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Row(),
                        Text(
                          item?.get('team_a') + ' vs ' + item?.get('team_b'),
                          style: const TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          item?.get('team_a') + ' : ' + item?.get('score_a'),
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          item?.get('team_b') + ' : ' + item?.get('score_b'),
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Time : ${item?.get('Time')}",
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Total Time : ${item?.get('TotalTime')}",
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        ],
      ),
    );
  }
}