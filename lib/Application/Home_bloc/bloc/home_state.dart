part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required bool isError,
      required bool isLoading,

    required ResuultModel resultList
  }) = _Initial;
  factory HomeState.initial()=>HomeState(resultList:ResuultModel(results: []),isError: false,isLoading: false);
}
