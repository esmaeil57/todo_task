import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_task/models/task_model.dart';

class FirebaseManager{



  static CollectionReference<TaskModel> getTasksCollections(){
     return  FirebaseFirestore.instance.collection("Tasks")
        .withConverter<TaskModel>(
        fromFirestore: (snapshot , _ ){
          return TaskModel.fromJson(snapshot.data()!);
        },
        toFirestore: (task,_){
          return task.toJson();
    }
    );
  }

  static Future<void> addTasks(TaskModel task)async {
    var collection = getTasksCollections();
     var docReference = collection.doc();
     task.id = docReference.id ;
     docReference.set(task);
  }
}