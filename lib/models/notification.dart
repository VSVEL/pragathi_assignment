class Notification {
  final String image;
  final String title;
  final String body;
  final String timestamp;

  Notification(
      {required this.body,
      required this.title,
      required this.image,
      required this.timestamp});

  factory Notification.fromJSON(Map<String, dynamic> json) {
    return Notification(
        body: json['body'],
        title: json['title'],
        image: json['image'],
        timestamp: json['timestamp']);
  }
}
