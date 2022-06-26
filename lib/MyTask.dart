import 'package:flutter/material.dart';
import 'package:flutter10_semi_finals/TODO_Cubit/Cubit.dart';
import 'package:flutter10_semi_finals/TODO_Cubit/States.dart';
import 'package:flutter10_semi_finals/TaskModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class MyTask extends StatelessWidget {

MyTask({required Map model}){
  modelMap = model;
}

late Map modelMap;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit,TodoStates>(
      listener: (context,state){},
      builder: (context,state){
        TodoCubit myCubit = TodoCubit.get(context);
        return  Dismissible(
          background: Container(color: Colors.red,),
          key: Key(modelMap['id'].toString()),
          onDismissed: (direction){
          myCubit.deleteDatabase(modelMap['id']);
          },
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    child: Text(modelMap['time']),
                    radius: 35,
                  ),
                ),
                Column(
                  children: [
                    Text(modelMap['title'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Text(modelMap['description'],style: TextStyle(fontSize: 15,fontStyle: FontStyle.italic,)),
                  ],
                ),
                Row(
                  children: [
                    IconButton(onPressed: (){
                      myCubit.updateDatabase('done', modelMap['id']);
                    }, icon: Icon(Icons.check_circle),color:Colors.green),
                    IconButton(onPressed: (){
                      myCubit.updateDatabase('archive', modelMap['id']);
                    }, icon: Icon(Icons.archive_outlined),color: Colors.grey,),
                  ],
                )
              ]
          ),
        );
      },
    );




    //       IconButton(onPressed: (){}, icon: Icon(Icons.check)),
    //   leading: CircleAvatar(
    //     child: Text(modelMap['time']),
    //     radius: 60,
    //   ) ,
    //   title:Text(modelMap['title']) ,
    //   subtitle: Text(modelMap['description']) ,
    // );
  }
}
