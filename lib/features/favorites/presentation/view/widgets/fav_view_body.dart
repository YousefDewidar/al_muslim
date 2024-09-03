// import 'package:al_muslim/core/widgets/custom_app_bar.dart';
// import 'package:al_muslim/features/athkar/views/widgets/zekr_card.dart';
// import 'package:al_muslim/features/favorites/presentation/view%20model/cubit/fav_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class FavViewBody extends StatelessWidget {
//   const FavViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const CustomAppBar(header: 'المفضلة', desc: 'جميع الأذكار التي اعجبتك'),
//         Expanded(child: BlocBuilder<FavCubit, FavState>(
//           builder: (context, state) {
//             return FutureBuilder(
//               future: BlocProvider.of<FavCubit>(context).getFavFromLDB(),
//               builder: (context, snap) {
//                 if (snap.hasData) {
//                   return ListView.builder(
//                     itemCount: snap.data!.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return ZekrCard(
//                         azkar: snap.data![index],
//                         isFavvvv: BlocProvider.of<FavCubit>(context).isFound(
//                           snap.data![index],
//                         ),
//                       );
//                     },
//                   );
//                 } else if (snap.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else {
//                   return const Center(
//                     child: Text(
//                       'لا توجد أذكار في المفضلة',
//                       style: TextStyle(fontSize: 25),
//                     ),
//                   );
//                 }
//               },
//             );
//           },
//         ))
//       ],
//     );
//   }
// }
