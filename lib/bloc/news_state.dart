part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class HeadlineNewsLoadedState extends NewsState {
  final List<News>? news;
  final List<News>? news2;

  const HeadlineNewsLoadedState({this.news, this.news2});

  @override
  List<Object> get props => [news!];
}

class HeadlineNewsFailState extends NewsState {
  final String message;

  const HeadlineNewsFailState(this.message);

  @override
  List<Object> get props => [message];
}

class ListNewsLoadedState extends NewsState {
  final List<News>? news;

  const ListNewsLoadedState({this.news});

  @override
  List<Object> get props => [news!];
}

class ListNewsFailState extends NewsState {
  final String? message;

  const ListNewsFailState({this.message});

  @override
  List<Object> get props => [message!];
}

class OnSelectedListNews extends NewsState {}

class OnLoadFavNewsState extends NewsState {}

class ListFavNewsLoaded extends NewsState {
  final List<News> value;

  const ListFavNewsLoaded(this.value);

  @override
  List<Object> get props => [value];
}

class ListFavNewsFailLoaded extends NewsState {
  final String message;

  const ListFavNewsFailLoaded(this.message);

  @override
  List<Object> get props => [message];
}
