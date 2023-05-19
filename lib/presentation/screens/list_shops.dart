import 'package:apptacc/bloc/shops/shops_bloc.dart';
import 'package:apptacc/bloc/shops/shops_event.dart';
import 'package:apptacc/bloc/shops/shops_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme.dart';
import '../../model/shop_model.dart';
import '../widgets/shop_row.dart';

class ListShops extends StatefulWidget {
  const ListShops({super.key});

  @override
  State<ListShops> createState() => _ListShopsState();
}

class _ListShopsState extends State<ListShops> {
  final ShopsBloc _newBloc = ShopsBloc();


 @override
  void initState() {
    //_newBloc.add(GetShopList());
    _newBloc.add(GetLocalShopList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? categoria = ModalRoute.of(context)?.settings.arguments.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text('AppTacc'),
        backgroundColor: AppTheme.naranja,
      ),
       backgroundColor: AppTheme.fondo,
      body: Container(
          margin: const EdgeInsets.all(8),
          child: BlocProvider(
              create: (context) => _newBloc,
              child: BlocListener<ShopsBloc, ShopsState>(
                listener: (context, state) {
                  if (state is ShopsError) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.message!),
                    ));
                  }
                },
                child:
                    BlocBuilder<ShopsBloc, ShopsState>(builder: (context, state) {
                  if (state is ShopsInitial) {
                    return Text('ShopsInitial');
                  } else if (state is ShopsLoading) {
                    return _buildLoading();
                  } else if (state is ShopsLoaded) {
                    return _buildList(context, state.list);
                  } else if (state is ShopsError) {
                    return Text('ShopsError');
                  } else {
                    return Container();
                  }
                }),
              ))),
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());

  Widget _buildList(BuildContext context, List<ShopModel> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return ShopRow(list[index]);
      },
    );
  }
}
