import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:navigation_watchlist/bloc/watchlist_bloc.dart';
import 'package:navigation_watchlist/bloc/watchlist_bloc.dart';
import 'package:navigation_watchlist/bloc/watchlist_event.dart';
import 'bloc/watchlist_bloc.dart';
import 'bloc/watchlist_bloc.dart';
import 'contact_item.dart';

import 'model/contact_data_model.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late WatchlistBloc watchlistBloc;

  @override
  void initState() {
    super.initState();
    watchlistBloc = BlocProvider.of<WatchlistBloc>(context);
    watchlistBloc.add(WatchlistEvent());
  }

  List<Contact> contactdata = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchlistBloc, WatchlistState>(
      builder: (context, state) {
        return Scaffold(
          
            body: SingleChildScrollView(
           
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                BlocBuilder<WatchlistBloc, WatchlistState>(
                    builder: (BuildContext context, WatchlistState state) {
                  List<Contact> data = state.props;
                  {
                    return contactlist(context, data);
                  }
                })
              ],
            ),
          ),
        ));
      },
    );
  }
}
