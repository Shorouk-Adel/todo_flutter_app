import 'package:flutter/material.dart';
import 'MyTask.dart';
import 'TODO_Cubit/Cubit.dart';
import 'TODO_Cubit/States.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AllTasks extends StatelessWidget {
  var list ;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit,TodoStates>(
          listener: (BuildContext context, Object? state) {  },
          builder: (BuildContext context, state) {
            TodoCubit myCubit = TodoCubit.get(context);
            list = myCubit.allTasksList;
            return Center(
            child: ListView.builder(itemBuilder:(BuildContext context,index){

              return MyTask(model:list[index]);
            },
            itemCount:list.length ),
            );
    },
    );
  }
}
