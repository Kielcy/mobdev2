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

class Todo {
  final String id;
  final String text;
  final bool isDone;
  final Category category;
  final Priority priority;

  const Todo({
    required this.id,
    required this.text,
    required this.isDone,
    required this.category,
    required this.priority,
  });

  Todo copyWith({
    String? id,
    String? text,
    bool? isDone,
    Category? category,
    Priority? priority,
  }) {
    return Todo(
      id: id ?? this.id,
      text: text ?? this.text,
      isDone: isDone ?? this.isDone,
      category: category ?? this.category,
      priority: priority ?? this.priority,
    );
  }

  @override
  String toString() {
    return "${category.emoji} $text (Done: $isDone, Priority: ${priority.label})";
  }
}

List<Todo> addTodo(
  List<Todo> todos,
  String text,
  Category category,
  Priority priority,
) {
  final newTodo = Todo(
    id: DateTime.now().millisecondsSinceEpoch.toString(),
    text: text,
    isDone: false,
    category: category,
    priority: priority,
  );
  return [...todos, newTodo];
}

List<Todo> deleteTodo(List<Todo> todos, String id) {
  return todos.where((t) => t.id != id).toList();
}

List<Todo> toggleTodo(List<Todo> todos, String id) {
  return todos.map((t) {
    if (t.id == id) {
      return t.copyWith(isDone: !t.isDone);
    }
    return t;
  }).toList();
}

void _printTodos(List<Todo> todos) {
  if (todos.isEmpty) {
    print("No todos.");
    return;
  }
  for (var todo in todos) {
    print(todo);
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
  Category myCategory = Category.personal;

  Todo myTodo = Todo(
    id: id,
    text: taskText,
    isDone: isDone,
    category: myCategory,
    priority: myPriority,
  );

  print(myTodo.priority.label);
  print(myTodo.category.emoji);

  Todo updatedTodo = myTodo.copyWith(isDone: true);
  print(updatedTodo.isDone);

  List<Todo> todos = [
    Todo(
      id: "1",
      text: "Morning run",
      isDone: false,
      category: Category.health,
      priority: Priority.mid,
    ),
    Todo(
      id: "2",
      text: "Design review",
      isDone: false,
      category: Category.work,
      priority: Priority.high,
    ),
    Todo(
      id: "3",
      text: "Read 30 pages",
      isDone: true,
      category: Category.personal,
      priority: Priority.low,
    ),
  ];

  print("\n--- All Todos ---");
  _printTodos(todos);

  final doneTodos = todos.where((t) => t.isDone).toList();
  print("\nDone tasks count: ${doneTodos.length}");

  final textList = todos.map((t) => t.text).toList();
  print("Todo texts: $textList");

  bool hasUrgent = todos.any((t) => t.priority == Priority.high);
  print("Has urgent task: $hasUrgent");

  final updatedTodos = [
    ...todos,
    Todo(
      id: "4",
      text: "Sketch logos",
      isDone: false,
      category: Category.creative,
      priority: Priority.mid,
    ),
  ];

  print("Total todos after adding new one: ${updatedTodos.length}");

  todos = addTodo(todos, "Buy coffee", Category.personal, Priority.low);
  print("\nAfter adding a new todo:");
  _printTodos(todos);

  final firstTodoId = todos.first.id;
  todos = toggleTodo(todos, firstTodoId);
  print("\nAfter toggling first todo (ID: $firstTodoId):");
  _printTodos(todos);

  final lastTodoId = todos.last.id;
  todos = deleteTodo(todos, lastTodoId);
  print("\nAfter deleting last todo (ID: $lastTodoId):");
  _printTodos(todos);
}
