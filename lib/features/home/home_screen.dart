import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "home";
  static String routeURL = "/home";

  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _deleteMood(String id) async {
    await _firestore.collection('moods').doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('moods').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final moods = snapshot.data!.docs;

          return ListView.builder(
            itemCount: moods.length,
            itemBuilder: (context, index) {
              final mood = moods[index];
              final timestamp = mood['timestamp'] != null
                  ? (mood['timestamp'] as Timestamp).toDate()
                  : DateTime.now();
              final formattedDate = DateFormat.yMMMd().format(timestamp);

              return GestureDetector(
                onLongPress: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Delete Mood'),
                        content: const Text(
                            'Are you sure you want to delete this mood entry?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              _deleteMood(mood.id);
                              Navigator.of(context).pop();
                            },
                            child: const Text('Delete'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Card(
                  child: ListTile(
                    title: Text("Mood: ${mood['emoji']}"),
                    subtitle: Text(mood['description']),
                    trailing: Text(
                      formattedDate,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
