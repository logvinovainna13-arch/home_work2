import 'package:bloc/bloc.dart';
import 'package:home_work2/data/repository/pet_repository.dart';
import 'package:meta/meta.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final PetRepository _repository = PetRepository();

  CatBloc() : super(CatInitial()) {
    on<CatDogImageEvent>((event, emit) async{
      try{
        emit (LoadingCatState());
        final String catImage = await _repository.getRandomCatImage();
        emit (LoadedCatImageState (img: catImage));
      } catch (error) {
        Talker().error(error);
        emit(ErrorCatState());
      }
    });
  }
}