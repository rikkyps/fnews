part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class StartNewsEvent extends NewsEvent {}

class LoadHeadlineNewsEvent extends NewsEvent {
  final String param;

  const LoadHeadlineNewsEvent(this.param);
  List<Object> get() => [param];
}

class LoadListNewsEvent extends NewsEvent {
  final String param;

  const LoadListNewsEvent(this.param);
  List<Object> get() => [param];
}

class LoadFavNewsEvent extends NewsEvent {}
