import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String body;
  final DateTime date;

  NotificationWidget({
    required this.imageUrl,
    required this.title,
    required this.body,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate the time difference from today
    final today = DateTime.now();
    final difference = today.difference(date);

    // Format the date for display
    final formattedDate = DateFormat.yMMMd().format(date);

    return Material(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage('images/'+imageUrl),
          ),
          title: Text(title),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(body),
              SizedBox(height: 4),
              Text('${difference.inDays} days ago'),
            ],
          ),
        ),
      ),
    );
  }
}


