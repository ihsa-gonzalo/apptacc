import 'dart:async';

import 'package:apptacc/bloc/shops/shops_event.dart';
import 'package:apptacc/bloc/shops/shops_state.dart';
import 'package:apptacc/model/shop_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../resources/api_repository.dart';

class ShopsBloc extends Bloc<ShopsEvent, ShopsState> {
  List<ShopModel> mList = [];

  ShopsBloc() : super(ShopsInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetFavShopList>((event, emit) 
    {
        emit(ShopsLoading());  
        emit(ShopsLoaded(mList.where((element) => element.isFavourite == true).toList()));
    },);

    on<RestoreShopList>((event, emit) 
    {
      emit(ShopsLoading());  
      emit(ShopsLoaded(mList));
    },);

    on<ShopUpdateFav>(
      (event, emit) {
        emit(ShopsLoading());
        bool? isFav = event.isFav;
        int? pos = event.position;
        mList[pos!].isFavourite = isFav!;
        emit(ShopsLoaded(mList));
      },
    );

    on<GetSearchLocalShopList>(
      (event, emit) async {
        emit(ShopsLoading());
        mList = await apiRepository.fetchSearchLocalShopList(event.name);
        emit(ShopsLoaded(mList));
      },
    );

    on<GetShopList>((event, emit) async {
      try {
        emit(ShopsLoading());
        mList = await apiRepository.fetchShopList();
        emit(ShopsLoaded(mList));
      } on DioError catch (ex) 
      {
        if (ex.type == DioErrorType.connectTimeout)
        {
          emit(const ShopsError("El servidor no respondio. Se cargará la lista local"));
        }
        else
        {
          emit(const ShopsError("Error no contemplado"));
        }
        
      } on NetworkError {
        emit(const ShopsError("Failed to fetch data. is your device online?"));
      }
    });

    on<GetLocalShopList>(
      (event, emit) async {
        emit(ShopsLoading());
        mList = await apiRepository.fetchLocalShopList();
        emit(ShopsLoaded(mList));

        ///emit (ShopsError("Error"));
      },
    );
  }
}
