import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fnews/models/models.dart';
import 'package:fnews/services/services.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<NewsEvent>((event, emit) async {
      if (event is StartNewsEvent) {
        emit(NewsInitial());
      } else if (event is LoadHeadlineNewsEvent) {
        ReturnValue val = await NewsServices.getHeadlineNews();
        ReturnValue val2 = await NewsServices.getListNews(event.param);
        if (val.message == null && val2.message == null) {
          emit(HeadlineNewsLoadedState(news: val.value, news2: val2.value));
        } else {
          emit(HeadlineNewsFailState(val.message!));
        }
      } else if (event is LoadListNewsEvent) {
        emit(OnSelectedListNews());
        await Future.delayed(const Duration(seconds: 1));
        ReturnValue val = await NewsServices.getListNews(event.param);
        if (val.message == null) {
          emit(ListNewsLoadedState(news: val.value));
        } else {
          emit(ListNewsFailState(message: val.message));
        }
      } else if (event is LoadFavNewsEvent) {
        emit(OnLoadFavNewsState());

        await Future.delayed(const Duration(seconds: 1));
        ReturnValue val = await NewsServices.getFavoriteNews();

        if (val.message == null) {
          emit(ListFavNewsLoaded(val.value));
        } else {
          emit(ListFavNewsFailLoaded(val.message!));
        }
      }
    });
  }
}
