import 'package:apptacc/bloc/shops/shops_bloc.dart';
import 'package:apptacc/bloc/shops/shops_event.dart';
import 'package:apptacc/bloc/shops/shops_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../config/theme.dart';
import '../../model/shop_model.dart';
import '../../model/usuario_model.dart';
import '../../provider/login_provider.dart';
import '../widgets/drawer_header.dart';
import '../widgets/shop_row.dart';

class ListShops extends StatefulWidget {
  final user_model? user;

  const ListShops(this.user, {super.key});

  @override
  State<ListShops> createState() => _ListShopsState();
}

class _ListShopsState extends State<ListShops> {
  final ShopsBloc _newBloc = ShopsBloc();
  user_model? user;

  @override
  void initState() {
    //_newBloc.add(GetShopList());
    _newBloc.add(GetLocalShopList());
    user = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? categoria = ModalRoute.of(context)?.settings.arguments.toString();
    final loginForm = Provider.of<LoginFormProvider>(context);
    

    return Scaffold(
      appBar: AppBar(
        title: const Text('AppTacc'),
        backgroundColor: AppTheme.naranja,
      ),
      backgroundColor: AppTheme.fondo,
      drawer: Drawer(
          child: Column(
        children: [
          const MyDrawerHeader(),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            title: const Text("Desarrollada por: Gonzalo Benoffi"),
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
              title: loginForm.user != null
                  ? Text("Usuario: ${loginForm.user!.username}")
                  : Container()),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.login),
                ),
                title: loginForm.user!= null ? const Text("Salir") : const Text("Login"),
                subtitle: loginForm.user!= null ? const Text('Presiona para salir') : const Text('Presiona para entrar'),
                onTap: () 
                {
                  if (loginForm.user==null)
                          Navigator.popAndPushNamed(context, "login");
                  else
                  {
                    user = null;
                    //TODO llamar al provider
                  }
                },
              ),
            ),
          )
        ],
      )),
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
                child: BlocBuilder<ShopsBloc, ShopsState>(
                    builder: (context, state) {
                  if (state is ShopsInitial) {
                    return const Text('ShopsInitial');
                  } else if (state is ShopsLoading) {
                    return _buildLoading();
                  } else if (state is ShopsLoaded) {
                    return _buildList(context, state.list);
                  } else if (state is ShopsError) {
                    return const Text('ShopsError');
                  } else {
                    return Container();
                  }
                }),
              ))),
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());

  Widget _buildList(BuildContext context, List<ShopModel> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return ShopRow(list[index]);
      },
    );
  }
}
