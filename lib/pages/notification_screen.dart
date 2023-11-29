import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prag_assignment/services/theme.dart';

import '../components/notification_card.dart';
import '../services/api_endpoints.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Map<String, dynamic>> notifications = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchNotifications();
  }

  void fetchNotifications() async {
    final apiUrl =
        'https://raw.githubusercontent.com/sayanp23/test-api/main/test-notifications.json'; // Replace with your API endpoint
    try {
      List<Map<String, dynamic>> result =
          await ApiService.fetchNotifications(apiUrl);
      // print(result);

      setState(() {
        notifications = result;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // Handle error, show an error message, etc.
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Notifications',
            style: GoogleFonts.quicksand(
              color: Colors.black,
            ),
          ),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset('images/back.png'),
          ),
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: AppTheme.primaryGreen,
                ),
              )
            : ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return NotificationWidget(
                    imageUrl: notification['image'],
                    title: notification['title'],
                    body: notification['body'],
                    date: DateTime.parse(notification['timestamp']),
                  );
                },
              ),
      ),
    );
  }
}
