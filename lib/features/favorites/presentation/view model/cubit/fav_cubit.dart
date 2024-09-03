import 'package:al_muslim/features/athkar/data/azkar_all_model.dart';
import 'package:al_muslim/features/favorites/presentation/view%20model/cubit/fav_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavInitial());
  static List<AllAzkarModel> allFavList = [];


  


}












  // Future<void> setFavToLDB() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   var jsonList =
  //       allFavList.map((zekr) => json.encode(zekr.toJson())).toList();
  //   await prefs.setStringList('fav_list', jsonList);
  //   emit(state);
  // }

  // Future<List<AllAzkarModel>> getFavFromLDB() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   List<String> jsonList = prefs.getStringList('fav_list') ?? [];

  //   return jsonList.map((jsonString) {
  //     Map<String, dynamic> jsonMap = json.decode(jsonString);
  //     emit(state);
  //     return AllAzkarModel.fromJsonToFav(jsonMap);
  //   }).toList();
  // }

  // void addToFav({required AllAzkarModel zekr}) {
  //   allFavList.add(zekr);
  //   setFavToLDB();

  //   emit(AddFav());
  // }

  // void removeFromFav({required AllAzkarModel zekr}) {
  //   allFavList.clear();
  //   setFavToLDB();
  //   emit(RemoveFav());
  // }

  // bool isFound(AllAzkarModel zekr) {
  //   for (var element in allFavList) {
  //     if (element.text == zekr.text) {
  //       return true;
  //     }
  //   }
  //   return false;
  // }
