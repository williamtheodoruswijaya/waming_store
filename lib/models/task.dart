// Class buat bikin object Task
class Task {
  String title;
  String description;
  String iconPath;
  bool isImportant;
  bool isComplete;
  double progress;
  DateTime dueData;

  // Masih gatau cara bikin constructor pake shortcut di dart dengan vscode
  Task(this.title, this.description, this.iconPath, this.isImportant,
      this.isComplete, this.progress, this.dueData);
}
