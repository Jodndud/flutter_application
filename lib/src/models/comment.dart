class Comment {
  int id;
  String name;
  String email;
  String body;

  // Comment(int id, String name, String email, String body) {
  //   this.id = id;
  //   this.name = name;
  //   this.email = email;
  //   this.body = body;
  // }
  Comment({required this.id, required this.name, required this.email, required this.body});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }
}