abstract class TodoStates{}

class InitialTodoState extends TodoStates{}
class BottomNavigationBarItemChanged extends TodoStates{}
class AddedTaskState extends TodoStates{}

class CreateDataBase extends TodoStates{}
class GetFromDataBase extends TodoStates{}
class InsertIntoDataBase extends TodoStates{}
class OpenDataBase extends TodoStates {}
class BottomSheetStateChanged extends TodoStates {}
class updateDatabaseState extends TodoStates{}
class DeleteDatabaseState extends TodoStates{}