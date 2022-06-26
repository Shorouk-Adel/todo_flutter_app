import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../AllTasks.dart';
import '../ArchivedTasks.dart';
import '../DoneTasks.dart';
import 'States.dart';

class TodoCubit extends Cubit<TodoStates>{
  // call Super constructor with initial State
  TodoCubit() : super(InitialTodoState());
  // create get method that return Object of TODO Cubit
  static TodoCubit get(context) => BlocProvider.of(context);
  // Data
  bool bottomSheetOpened = false;
  IconData fabIcon = Icons.add;
  late Database myDB;
  int index = 0;
  List<Widget> myScreens = [AllTasks(),ArchivedTasks(),DoneTasks()];
  List<Widget> appBars   = [Text('All Tasks'),Text('Archived'),Text('Done'),];
  List allTasksList = [];
  List archivedTasksList = [];
  List doneTasksList = [];
 // Actions
 void changeIndex(int newIndex){
   index = newIndex;
   emit(BottomNavigationBarItemChanged());
 }
  void createDB() async{
    myDB = await openDatabase(
        'todo.db',
        version: 1,
        onCreate: (database,version) async{
          print('DB is created');
          await  database.execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, description TEXT,time TEXT,status TEXT)')
              .then((value){
            print('table created');
            emit(CreateDataBase());
          }).catchError((error){
            print("error found on DB is : $error");
          });
        },
        onOpen: (database){
          print("DB is opened");
          readFromDB(database);
          emit(OpenDataBase());

        }
    ).catchError((error){
      print(error.toString());
    });
  }


  void insertDB(String title,String description, String time) async{
    myDB!.transaction((txn) async {
      txn.rawInsert('INSERT INTO tasks(title,description,time,status) VALUES("$title","$description","$time","new")').then((value){
        emit(InsertIntoDataBase());
        print('$value inserted Successfully');
        readFromDB(myDB).then((value){
          allTasksList = [];
          allTasksList = value;
          print(allTasksList);
          emit(GetFromDataBase());
        });
      }).catchError((onError){});
    });
  }


  Future<List<Map<dynamic,dynamic>>> readFromDB(database) async {
    List<Map> tasks =await database!.rawQuery('SELECT * FROM tasks');
    print ('--------- $tasks');
    allTasksList = [];
    archivedTasksList = [];
    doneTasksList = [];
    tasks.forEach((map) {
      if(map['status'] == 'new'){
        allTasksList.add(map);
      }
      else if(map['status'] == 'done'){
        doneTasksList.add(map);
      }
      else{
        archivedTasksList.add(map);
      }
    });

    emit(GetFromDataBase());
    return tasks;

  }
  void updateDatabase  (String newStatus, int id)async{
    await myDB.rawUpdate(
        'UPDATE tasks SET status = "$newStatus" WHERE id = $id').then((value) {
          print('row $value updated successfully');
          emit(updateDatabaseState());
          readFromDB(myDB).then((value) {
            print(value);
          });
          emit(GetFromDataBase());
    }).catchError((error){
      print('Error happened while updating record $error');
    });
  }
  void deleteDatabase(int id) async{
    await myDB
        .rawDelete('DELETE FROM tasks WHERE id = $id').then((value){
          print('deleted succesfully');
          emit(DeleteDatabaseState());
        });
    readFromDB(myDB).then((value) {
      print(value);
    });
  }
  void changeBottomSheetState(IconData icon, bool isOpened){
    fabIcon = icon;
    bottomSheetOpened = isOpened;
    emit(BottomSheetStateChanged());
  }
}