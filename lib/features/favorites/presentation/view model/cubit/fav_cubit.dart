import 'dart:convert';
import 'dart:developer';

import 'package:al_muslim/features/athkar/data/azkar_model.dart';
import 'package:al_muslim/features/favorites/presentation/view%20model/cubit/fav_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavInitial());
  static List<AzkarModel> allFavList = [];

  Future<void> setFavToLDB() async {
    // log(allFavList.toString());
    final prefs = await SharedPreferences.getInstance();
    var jsonList =
        allFavList.map((zekr) => json.encode(zekr.toJson())).toList();
    await prefs.setStringList('fav_list', jsonList);
    emit(state);
  }

  Future<List<AzkarModel>> getFavFromLDB() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> jsonList = prefs.getStringList('fav_list') ?? [];

    return jsonList.map((jsonString) {
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      emit(state);
      return AzkarModel.fromJsonToFav(jsonMap);
    }).toList();
  }

  void addToFav({required AzkarModel zekr}) {
    allFavList.add(zekr);
    setFavToLDB();
    // log(allFavList.toString());

    emit(AddFav());
  }

  void removeFromFav({required AzkarModel zekr}) {
    log(allFavList.toString());
    allFavList.clear();
    setFavToLDB();
    log(allFavList.toString());
    // log(doneRemove.toString());

    emit(RemoveFav());
  }

  bool isFound(AzkarModel zekr) {
    for (var element in allFavList) {
      if (element.text == zekr.text) {
        return true;
      }
    }
    return false;
  }
}
