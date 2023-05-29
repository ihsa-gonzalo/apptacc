import 'package:apptacc/bloc/shops/shops_event.dart';
import 'package:apptacc/bloc/shops/shops_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../resources/api_repository.dart';


class ShopsBloc extends Bloc<ShopsEvent, ShopsState> 
{
  ShopsBloc() : super(ShopsInitial()) 
  {
    final ApiRepository apiRepository = ApiRepository();

    
    on<GetShopList>((event, emit) async 
    {
      try 
      {
        emit(ShopsLoading());
        final mList = await apiRepository.fetchShopList();
        emit(ShopsLoaded(mList));
        if (mList.isEmpty) {
          emit(const ShopsError("Lista vacia"));
        }
      } 
      on NetworkError 
      {
        emit(const ShopsError("Failed to fetch data. is your device online?"));
      }
    });
    

    on<GetLocalShopList>((event, emit) async
    {
      
        emit(ShopsLoading());
        final mList = await apiRepository.fetchLocalShopList();
        emit(ShopsLoaded(mList));
        if (mList.isEmpty) {
          emit(const ShopsError("Lista vacia"));
        }

    },);

  }
}