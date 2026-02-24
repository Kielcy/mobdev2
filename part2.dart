enum Priority { low, mid, high }

extension PriorityExtension on Priority {
  String get label {
    switch (this) {
      case Priority.low:
        return "Low";
      case Priority.mid:
        return "Mid";
      case Priority.high:
        return "High";
    }
  }
}

enum Category { personal, work, health, creative }

extension CategoryExtension on Category {
  String get emoji {
    switch (this) {
      case Category.personal:
        return "💁";
      case Category.work:
        return "⚡";
      case Category.health:
        return "❤️";
      case Category.creative:
        return "🎨";
    }
  }
}

void main() {
  String taskText = "Buy groceries";
  print(taskText);

  bool isDone = false;
  print(isDone);

  final String id = "todo-001";
  print(id);

  String? dueDate = null;
  print(dueDate);

  Priority myPriority = Priority.high;
  print(myPriority);
  print(myPriority.label);

  Category myCategory = Category.work;
  print(myCategory);
  print(myCategory.emoji);
}
