import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo/models/task_model.dart';

Future<List<Task>> getTasks(int catagory) async {
  final tasks = await Supabase.instance.client
      .from("ToDo")
      .select('*, category(category)')
      .eq("category_id", catagory);
  List<Task> taskList = [];
  for (var task in tasks) {
    taskList.add(Task.fromJson(task));
  }

  taskList.sort((a, b) => a.isCompleted! ? 1 : -1);
  return taskList;
}

checkTask(bool newState, int id) async {
  await Supabase.instance.client
      .from("ToDo")
      .update({"is_completed": newState}).eq('id', id);
}

addTask(String task, int categoryId) async {
  await Supabase.instance.client
      .from("ToDo")
      .insert({"task": task, "is_completed": false, "category_id": categoryId});
}

deleteTask(int id) async {
  await Supabase.instance.client.from("ToDo").delete().eq("id", id);
}
