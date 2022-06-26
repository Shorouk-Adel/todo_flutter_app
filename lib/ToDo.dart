import 'package:flutter/material.dart';
import 'package:flutter10_semi_finals/AddItem.dart';
import 'package:flutter10_semi_finals/TODO_Cubit/Cubit.dart';
import 'package:flutter10_semi_finals/TODO_Cubit/States.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
class TODO extends StatelessWidget {
  var scaffoldKey  = GlobalKey<ScaffoldState>();
  var formKey  = GlobalKey<FormState>();
  var descriptionController = TextEditingController();
  var timeController = TextEditingController();
  var titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(BuildContext context) => TodoCubit()..createDB(),
      child: BlocConsumer<TodoCubit,TodoStates>(
        listener:(context,state){} ,
        builder: (context,state) {
          TodoCubit cubit = TodoCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(title: cubit.appBars[cubit.index]),
            floatingActionButton: FloatingActionButton(
              onPressed: () async{
                if(cubit.bottomSheetOpened){
                  cubit.insertDB(titleController.text, descriptionController.text, timeController.text);
                  cubit.changeBottomSheetState(Icons.edit, false);
                  timeController.text = '';
                  titleController.text = '';
                  descriptionController.text = '';
                  Navigator.pop(context);
                }
                else{
                  cubit.changeBottomSheetState(Icons.edit, true);
                  scaffoldKey.currentState!.showBottomSheet((context) =>
                      Container(
                        color: Colors.grey[100],
                        padding: EdgeInsets.all(20.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  icon: Icon(Icons.text_fields),
                                  labelText: "Task Title",
                                ),
                                controller: titleController,
                              ),
                              TextFormField(
                                controller: descriptionController,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.list),
                                  labelText: "Task description",

                                ),
                              ),
                              TextFormField(
                                controller: timeController,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.watch_later),
                                  labelText: "Task Time",
                                ),
                                onTap: (){
                                  showTimePicker(context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((value) => timeController.text = value!.format(context).toString());
                                },
                              ),
                            ],
                          ),
                        ),
                      ),);
                }

                  //     .closed.then((value){});
                  // cubit.changeBottomSheetState(Icons.edit, true);
                },
              child: Icon(cubit.fabIcon),
            ),
            body: cubit.myScreens[cubit.index],
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home),label: "All Tasks"),
                BottomNavigationBarItem(icon: Icon(Icons.archive_outlined),label: "Archived"),
                BottomNavigationBarItem(icon: Icon(Icons.done_outline_outlined),label: "Done Tasks"),
              ],
              currentIndex: cubit.index,
              onTap: (index){
                cubit.changeIndex(index);
              },
            ),
          );
          },
      ),
    );
  }
}
