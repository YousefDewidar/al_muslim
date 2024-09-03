import 'dart:convert';
import 'package:al_muslim/features/athkar/data/azkar_all_model.dart';
import 'package:al_muslim/features/favorites/presentation/view%20model/cubit/fav_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavInitial());
  static List<AllAzkarModel> allFavList = [];

  void addToFav(AllAzkarModel zkr) {
    allFavList.add(zkr);
    setFavToLDB();
  }

  void removeFromFav(AllAzkarModel zkr) {
    allFavList.removeWhere(
      (element) {
        if (element.text == zkr.text) {
          return true;
        } else {
          return false;
        }
      },
    );
    setFavToLDB();
    emit(RemoveFav());
  }

  Future<void> setFavToLDB() async {
    final prefs = await SharedPreferences.getInstance();
    var jsonList =
        allFavList.map((zekr) => json.encode(zekr.toJson(zekr))).toList();
    await prefs.setStringList('fav_list', jsonList);
  }

  Future<List<AllAzkarModel>> getFavFromLDB() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> jsonList = prefs.getStringList('fav_list') ?? [];

    return jsonList.map((jsonString) {
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      return AllAzkarModel.fromJson(jsonMap);
    }).toList();
  }

  Future<bool> isFound(AllAzkarModel zkr) async {
    List<AllAzkarModel> finalFavList = await getFavFromLDB();
    for (var element in finalFavList) {
      if (element.text == zkr.text) {
        emit(FoundState());
        return true;
      }
    }
    return false;
  }
}
