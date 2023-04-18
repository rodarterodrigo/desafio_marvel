import 'package:desafio_marvel/app/core/shared/modules/domain/failures/forbiden_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/generic_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/invalid_key_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/method_not_allowed_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/missing_parameter_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/receive_timeout_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/presentation/blocs/states/fetch_request_loading_state.dart';
import 'package:desafio_marvel/app/core/shared/modules/presentation/blocs/states/fetch_request_success_state.dart';
import 'package:desafio_marvel/app/core/shared/modules/presentation/blocs/states/forbiden_failure_state.dart';
import 'package:desafio_marvel/app/core/shared/modules/presentation/blocs/states/generic_failure_state.dart';
import 'package:desafio_marvel/app/core/shared/modules/presentation/blocs/states/get_request_success_state.dart';
import 'package:desafio_marvel/app/core/shared/modules/presentation/blocs/states/global_states.dart';
import 'package:desafio_marvel/app/core/shared/modules/presentation/blocs/states/loading_state.dart';
import 'package:desafio_marvel/app/core/shared/modules/presentation/blocs/states/receive_timeout_failure_state.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/character_data.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/usecases/get_character_list_usecase.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/presentation/blocs/events/fetch_character_list_event.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/presentation/blocs/events/get_character_list_event.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/presentation/blocs/events/marvel_character_list_events.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/presentation/blocs/states/invalid_key_failure_state.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/presentation/blocs/states/method_not_allowed_failure_state.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/presentation/blocs/states/missing_parameter_failure_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCharacterListBloc
    extends Bloc<MarvelCharacterListEvents, GlobalStates> {
  final GetCharacterListUsecase usecase;

  bool lastPage = false;
  int index = 0;
  int total = 0;

  List<CharacterData> characterListinfinityScroll = [];
  List<CharacterData> characterListhorizontalScroll = [];

  GetCharacterListBloc(this.usecase) : super(const LoadingState()) {
    on<GetCharacterListEvent>(_mapCharacterListToState);
    on<FetchCharacterListEvent>(_mapFetchCharacterListToState);
  }

  Future<void> _mapCharacterListToState(
      GetCharacterListEvent event, Emitter<GlobalStates> emitter) async {
    emitter(const LoadingState());
    final request = await usecase(event.offset, event.limit);
    emitter(
      request.fold((failure) {
        switch (failure.runtimeType) {
          case InvalidKeyFailure:
            return InvalidKeyFailureState(failure as InvalidKeyFailure);
          case MethodNotAllowedFailure:
            return MethodNotAllowedFailureState(
                failure as MethodNotAllowedFailure);
          case MissingParameterFailure:
            return MissingParameterFailureState(
                failure as MissingParameterFailure);
          case ReceiveTimeoutFailure:
            return ReceiveTimeoutFailureState(failure as ReceiveTimeoutFailure);
          case ForbidenFailure:
            return ForbidenFailureState(failure as ForbidenFailure);
          default:
            return GenericFailureState(failure as GenericFailure);
        }
      }, (success) {
        characterListinfinityScroll.addAll(success.data.characterList.list);
        success.data.characterList.list.map((e) {
          if (index < 5) {
            characterListhorizontalScroll.add(e);
            characterListinfinityScroll.removeWhere((element) => element == e);
          }
          index++;
        }).toList();
        total = success.data.total;
        return const GetRequestSuccessState();
      }),
    );
  }

  Future<void> _mapFetchCharacterListToState(
      FetchCharacterListEvent event, Emitter<GlobalStates> emitter) async {
    emitter(const FetchRequestLoadingState());
    final result = await usecase(event.offset, event.limit);
    emitter(result.fold((failure) {
      switch (failure.runtimeType) {
        case InvalidKeyFailure:
          return InvalidKeyFailureState(failure as InvalidKeyFailure);
        case MethodNotAllowedFailure:
          return MethodNotAllowedFailureState(
              failure as MethodNotAllowedFailure);
        case MissingParameterFailure:
          return MissingParameterFailureState(
              failure as MissingParameterFailure);
        case ReceiveTimeoutFailure:
          return ReceiveTimeoutFailureState(failure as ReceiveTimeoutFailure);
        case ForbidenFailure:
          return ForbidenFailureState(failure as ForbidenFailure);
        default:
          return GenericFailureState(failure as GenericFailure);
      }
    }, (success) {
      if ((characterListinfinityScroll.length - 5) == total) {
        lastPage = true;
      } else {
        lastPage = false;
      }
      success.data.characterList.list
          .map((e) => characterListinfinityScroll.add(e))
          .toList();
      return const FetchRequestSuccessState();
    }));
  }
}
