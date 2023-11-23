import 'package:bloc/bloc.dart';
import 'package:festa_test/Core/constants.dart';
import 'package:festa_test/Domain/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dio/dio.dart';
part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<_Started>((event, emit) async {
      try {
        emit(HomeState(
            isError: false,
            isLoading: true,
            resultList: ResuultModel(results: [])));
        Response response =
            await Dio(BaseOptions()).get(Constants.ApiEndpoints);
        if (response.statusCode == 200 || response.statusCode == 201) {
          final ReslutModelList = ResuultModel.fromJson(response.data);
          //  print(ReslutModelList);
          
          emit(HomeState(
              isError: false, isLoading: false, resultList: ReslutModelList));
        } else {
          emit(HomeState(
              isError: true,
              isLoading: false,
              resultList: ResuultModel(results: [])));
        }
      } catch (e) {
        emit(HomeState(
            isError: true,
            isLoading: false,
            resultList: ResuultModel(results: [])));
      }
    });
  }
}
