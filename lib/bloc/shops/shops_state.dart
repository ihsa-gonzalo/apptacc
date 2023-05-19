import 'package:apptacc/model/shop_model.dart';
import 'package:equatable/equatable.dart';

abstract class ShopsState extends Equatable {
  const ShopsState();

  @override
  List<Object?> get props => [];
}

class ShopsInitial extends ShopsState {}

class ShopsLoading extends ShopsState {}

class ShopsLoaded extends ShopsState {
  final List<ShopModel> list;

  const ShopsLoaded(this.list);
}

class ShopsError extends ShopsState {
  final String? message;
  const ShopsError(this.message);
}