import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_app/interfaces/house.dart';
import 'package:home_app/states/house_state.dart';

class HouseCubit extends Cubit<HouseState> {
  final IHouseRepository houseRepo;
  HouseCubit({required this.houseRepo}) : super(HouseInitial());
  Future<void> fetchHouses() async {
    final response = await houseRepo.fetchHouses();
    response.fold((houses) {
      emit(HouseLoaded(houses!));
    }, (error) {
      emit(error!);
    });
  }

  Future<void> addHouse(
      String title,
      String location,
      String description,
      num price,
      String category,
      num bedrooms,
      num bathrooms,
      num floors,
      bool forRent,
      File mainImage,
      List<File> subImages) async {
    emit(HouseLoading());
    final response = await houseRepo.addHouse(
        title,
        location,
        description,
        price,
        category,
        bedrooms,
        bathrooms,
        floors,
        forRent,
        mainImage,
        subImages);

    response.fold((added) {
      emit(HouseAdded());
    }, (error) {
      emit(error!);
    });
  }
}
