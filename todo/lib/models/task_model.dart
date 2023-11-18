class Task {
  int? id;
  String? task;
  bool? isCompleted;
  int? categoryId;
  Category? category;

  Task({this.id, this.task, this.isCompleted, this.categoryId, this.category});

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    task = json['task'];
    isCompleted = json['is_completed'];
    categoryId = json['category_id'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['task'] = task;
    data['is_completed'] = isCompleted;
    data['category_id'] = categoryId;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}

class Category {
  String? category;

  Category({this.category});

  Category.fromJson(Map<String, dynamic> json) {
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    return data;
  }
}
