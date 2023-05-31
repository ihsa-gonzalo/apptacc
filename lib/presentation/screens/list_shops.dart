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
import '../../provider/search_provider.dart';
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
  final TextEditingController _searchController = TextEditingController();

  user_model? user;

  @override
  void initState() {
    user = widget.user;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose(); //buena practica para liberar memoria
  }

  @override
  Widget build(BuildContext context) {
    String? categoria = ModalRoute.of(context)?.settings.arguments.toString();
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Consumer<SearchProvider>(
          builder: (context, value, child) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: value.isSearching
                  ? TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintText: 'Search',
                      ),
                      onChanged: (text) {
                        value.setSearchText(text);
                      },
                      onSubmitted: (value) {
                        if (value.isEmpty) {
                          _newBloc.add(GetLocalShopList());
                        } else {
                          _newBloc.add(GetSearchLocalShopList(value));
                        }
                      },
                    )
                  : const Text('AppTacc'),
            );
          },
        ),
        backgroundColor: AppTheme.naranja,
        actions: <Widget>[
          Consumer<SearchProvider>(
            builder: (context, value, child) {
              return IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  _searchController.text = "";
                  value.setIsSearching(true);
                },
              );
            },
          ),
        ],
        leading: Consumer<SearchProvider>(
          builder: (context, value, child) {
            if (value.isSearching) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  _searchController.text = "";
                  value.setIsSearching(false);
                  _newBloc.add(GetLocalShopList());
                },
              );
            } else {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            }
          },
        ),
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
                title: loginForm.user != null
                    ? const Text("Salir")
                    : const Text("Login"),
                subtitle: loginForm.user != null
                    ? const Text('Presiona para salir')
                    : const Text('Presiona para entrar'),
                onTap: () {
                  if (loginForm.user == null) {
                    Navigator.popAndPushNamed(context, "login");
                  } else {
                    user = null;
                    //TODO llamar al provider
                  }
                },
              ),
            ),
          )
        ],
      )),
      body: Consumer<SearchProvider>(builder: (context, value, child) {
        return Container(
            margin: const EdgeInsets.all(8),
            child: BlocProvider(
                create: (context) => _newBloc,
                child: BlocListener<ShopsBloc, ShopsState>(
                  listener: (context, state) { //para continuar flujo
                    if (state is ShopsError) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(state.message!),
                      ));
                      _newBloc.add(GetLocalShopList());
                    }
                    
                  },
                  child: BlocBuilder<ShopsBloc, ShopsState>(
                      builder: (context, state) {
                     if (state is ShopsInitial) 
                    {
                      _newBloc.add(GetShopList());
                      return _buildLoading();
                    }
                    else if (state is ShopsLoading) {
                      return _buildLoading();
                    }
                    else if (state is ShopsLoaded) 
                    {
                      return state.list.isEmpty ? const Center(child: Text("No hay locales disponibles",style: TextStyle(color: Colors.black),)) : _buildList(context, state.list);
                    }
                    /*
                    else if (state is ShopsError)
                    {
                      return Center(child: Text(state.message!,style: TextStyle(color: Colors.black),));
                    }
                    */
                    else 
                    {
                      return Container();
                    }
                  }),
                )));
      }),
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());

  Widget _buildList(BuildContext context, List<ShopModel> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return ShopRow(
          list[index],
          onTapFav: () {
            list[index].isFavourite = !(list[index].isFavourite!);
            _newBloc.add(ShopUpdateFav(list[index].isFavourite, index));
          },
        );
      },
    );
  }
}
