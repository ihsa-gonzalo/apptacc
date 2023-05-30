import 'package:equatable/equatable.dart';

abstract class ShopsEvent extends Equatable {
  const ShopsEvent();

  @override
  List<Object> get props => [];
}

class GetShopList extends ShopsEvent {}

class GetLocalShopList extends ShopsEvent {}

class GetSearchLocalShopList extends ShopsEvent 
{
    final String name;
    const GetSearchLocalShopList(this.name);
}