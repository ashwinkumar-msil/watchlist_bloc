import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:navigation_watchlist/model/contact_data_model.dart';
import 'package:navigation_watchlist/service/contactrespo.dart';
import 'package:navigation_watchlist/service/exception.dart';
import 'watchlist_event.dart';

part 'watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  late List<Contact> contactdata;
  late ContactRepo contactRepo;
  WatchlistBloc(this.contactRepo) : super(WatchlistInitial());


  @override
  Stream<WatchlistState> mapEventToState(WatchlistEvent event) async* {
    if (event is WatchlistEvent) {
      yield WatchlistLoading();
      try {
        contactdata = await contactRepo.fetchContact();
        yield WatchlistLoaded(contact: contactdata);
      } catch (e) {
        yield WatchlistError(
          UnknownException('Unknown Error'),
        );
      }
    }
  }
}
