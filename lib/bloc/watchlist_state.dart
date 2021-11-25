part of 'watchlist_bloc.dart';

abstract class WatchlistState extends Equatable {
  List<Contact> get props => [];
}

class WatchlistInitial extends WatchlistState {}

class WatchlistLoading extends WatchlistState {}

class WatchlistLoaded extends WatchlistState {
  final List<Contact> contact;
  WatchlistLoaded({required this.contact});
}

class WatchlistError extends WatchlistState {
  var error;
  WatchlistError(this.error);
}
