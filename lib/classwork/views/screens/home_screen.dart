// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../counter_cubit/counter_cubit.dart';
//
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     print("Asosoiy page build boldi");
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           Row(
//             children: [
//               IconButton(
//                 onPressed: () {
//                   context.read<CounterCubit>().decrement();
//                 },
//                 icon: Icon(Icons.remove),
//               ),
//               IconButton(
//                 onPressed: () {
//                   context.read<CounterCubit>().increment();
//                 },
//                 icon: Icon(Icons.add),
//               ),
//             ],
//           ),
//         ],
//       ),
//       body: BlocBuilder<CounterCubit,int>(
//         builder: (context,state) {
//           print("Bloc build ishladi");
//           return Center(child: Text(state.toString(),style: TextStyle(fontSize: 50),));
//         }
//       ),
//
//     );
//   }
// }
