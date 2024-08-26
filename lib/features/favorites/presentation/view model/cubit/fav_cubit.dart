import 'package:al_muslim/features/favorites/presentation/view%20model/cubit/fav_state.dart';
import 'package:al_muslim/features/hadith/data/model/hadith_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavInitial());
  List<HadithModel> allFavList = [];
}
