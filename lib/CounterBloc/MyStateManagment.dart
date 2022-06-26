//
// import 'package:flutter/material.dart';
// import 'package:flutter10_semi_finals/Cubit/CounterCubit.dart';
// import 'package:flutter10_semi_finals/Cubit/States.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class MyStateManagment extends StatelessWidget {
//   const MyStateManagment({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context)=> CounterCubit(),
//       child: BlocConsumer<CounterCubit,CounterStates>(
//         listener:(context,state) {
//           if(state is ResetCounterState){
//             print('Bingo');
//           }
//         },
//         builder:(context,state){
//           CounterCubit myCubit = CounterCubit.get(context);
//           if(state is ResetCounterState){
//             return Scaffold(
//               body: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             );
//           }
//           else{
//           return  Scaffold(
//             appBar: AppBar(title: Text("Bloc"),),
//             body: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ElevatedButton(onPressed: (){
//                       myCubit.decrement();
//                       }, child: Icon(Icons.remove)),
//                       SizedBox(width: 15,),
//                       Text(myCubit.counter.toString()),
//                       SizedBox(width: 15,),
//                       ElevatedButton(onPressed: (){
//                         myCubit.increment();
//                       }, child: Icon(Icons.add)),
//                     ],
//                   ),
//                   TextButton(onPressed: (){
//                     myCubit.reset();
//                   }, child: Text('Reset'))
//                 ],
//               ),
//             ),
//           );
//         }}
//
//       ),
//     );
//   }
// }
//
//
