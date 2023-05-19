import 'package:equatable/equatable.dart';

abstract class ShopsEvent extends Equatable {
  const ShopsEvent();

  @override
  List<Object> get props => [];
}

class GetShopList extends ShopsEvent {}