class PromptModel {
  int? id;
  String? title;
  String? prompt;
  String? userId;
  String? createdAt;
  User? user;

  PromptModel({
    this.id,
    this.title,
    this.prompt,
    this.userId,
    this.createdAt,
    this.user,
  });

  PromptModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    prompt = json['prompt'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['prompt'] = prompt;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? email;
  Metadata? metadata;

  User({this.email, this.metadata});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    return data;
  }
}

class Metadata {
  String? name;

  Metadata({this.name});

  Metadata.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}
