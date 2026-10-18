import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dog_event.dart';
part 'dog_state.dart';

class DogBloc extends Bloc<DogEvent, DogState> {
  final PetRepository _repository = PetRepository();

  DogBloc() : super(DogInitial()) {
    on<GetDogImageEvent>((event, emit) {
      try{
        emit (LoadingDogState());
        final String dogImage = await _repository.getRandomDogImage();
        emit (LoadedDogImageState (img: dogImage));
      } catch (error) {
        Talker().error(error);
        emit(ErrorDogState());
      }
    });
  }
}