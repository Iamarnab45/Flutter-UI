class PostModel {
  final String id;
  final String title;
  final String content;
  final String authorId;
  final String authorName;
  final DateTime createdAt;
  final String status; // 'pending', 'approved', 'rejected'
  final String type; // 'job', 'event', 'announcement'

  PostModel({
    required this.id,
    required this.title,
    required this.content,
    required this.authorId,
    required this.authorName,
    required this.createdAt,
    required this.status,
    required this.type,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      authorId: json['authorId'],
      authorName: json['authorName'],
      createdAt: DateTime.parse(json['createdAt']),
      status: json['status'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'authorId': authorId,
      'authorName': authorName,
      'createdAt': createdAt.toIso8601String(),
      'status': status,
      'type': type,
    };
  }
} 