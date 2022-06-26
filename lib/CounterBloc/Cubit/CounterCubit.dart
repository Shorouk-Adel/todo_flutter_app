// import 'package:bloc/bloc.dart';
// import 'package:flutter10_semi_finals/Cubit/States.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class CounterCubit extends Cubit<CounterStates>{
//   CounterCubit() : super(InitialCounterState());
//
//
//   // method returns Object of The Counter Cubit
//   static CounterCubit get(context) {
//      return BlocProvider.of(context);
//   }
//     // Data
//     int counter = 5;
//
//     // Actions
//     void increment(){
//       counter++;
//       print(counter);
//       emit(IncrementCounterState());
//     }
//
//     void decrement(){
//       counter--;
//       print(counter);
//       emit(DecrementCounterState());
//     }
//
//     void reset(){
//       counter = 0;
//       print(counter);
//       emit(ResetCounterState());
//     }
//   }
