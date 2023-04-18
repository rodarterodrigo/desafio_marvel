import 'package:desafio_marvel/app/core/shared/modules/domain/failures/forbiden_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/generic_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/receive_timeout_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/presentation/blocs/states/fetch_request_loading_state.dart';
import 'package:desafio_marvel/app/core/shared/modules/presentation/blocs/states/fetch_request_success_state.dart';
import 'package:desafio_marvel/app/core/shared/modules/presentation/blocs/states/forbiden_failure_state.dart';
import 'package:desafio_marvel/app/core/shared/modules/presentation/blocs/states/generic_failure_state.dart';
import 'package:desafio_marvel/app/core/shared/modules/presentation/blocs/states/get_request_success_state.dart';
import 'package:desafio_marvel/app/core/shared/modules/presentation/blocs/states/global_states.dart';
import 'package:desafio_marvel/app/core/shared/modules/presentation/blocs/states/loading_state.dart';
import 'package:desafio_marvel/app/core/shared/modules/presentation/blocs/states/receive_timeout_failure_state.dart';
import 'package:desafio_marvel/app/modules/character_detail/domain/entities/comic_detail_entity.dart';
import 'package:desafio_marvel/app/modules/character_detail/domain/usecases/get_comic_list_usecase.dart';
import 'package:desafio_marvel/app/modules/character_detail/presentation/blocs/events/comic_list_events.dart';
import 'package:desafio_marvel/app/modules/character_detail/presentation/blocs/events/fetch_comic_list_event.dart';
import 'package:desafio_marvel/app/modules/character_detail/presentation/blocs/events/get_comic_list_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetComicListBloc extends Bloc<ComicListEvents, GlobalStates> {
  final GetComicListUsecase usecase;

  bool lastPage = false;
  int page = 1;
  int index = 0;
  List<ComicDetailEntity> horizontalList = [];

  GetComicListBloc(this.usecase) : super(const LoadingState()) {
    on<GetComicListEvent>(_mapGetComicListToState);
    on<FetchComicListEvent>(_mapFetchComicListToState);
  }

  Future<void> _mapGetComicListToState(
      GetComicListEvent event, Emitter<GlobalStates> emitter) async {
    emitter(const LoadingState());
    final request = await usecase(event.url);
    emitter(
      request.fold((failure) {
        switch (failure.runtimeType) {
          case ReceiveTimeoutFailure:
            return ReceiveTimeoutFailureState(failure as ReceiveTimeoutFailure);
          case ForbidenFailure:
            return ForbidenFailureState(failure as ForbidenFailure);
          default:
            return GenericFailureState(failure as GenericFailure);
        }
      }, (success) {
        horizontalList.addAll(success.results.list);
        return const GetRequestSuccessState();
      }),
    );
  }

  Future<void> _mapFetchComicListToState(
      FetchComicListEvent event, Emitter<GlobalStates> emitter) async {
    emitter(const FetchRequestLoadingState());
    final result = await usecase(event.url);
    emitter(result.fold((failure) {
      switch (failure.runtimeType) {
        case ReceiveTimeoutFailure:
          return ReceiveTimeoutFailureState(failure as ReceiveTimeoutFailure);
        case ForbidenFailure:
          return ForbidenFailureState(failure as ForbidenFailure);
        default:
          return GenericFailureState(failure as GenericFailure);
      }
    }, (success) {
      if (success.results.list.length == success.total) {
        lastPage = true;
      } else {
        lastPage = false;
      }
      success.results.list.map((e) => horizontalList.add(e)).toList();
      return const FetchRequestSuccessState();
    }));
  }
}
