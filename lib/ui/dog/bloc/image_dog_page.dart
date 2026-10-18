import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart'

class ImageDogPage extends StatefullWidget {
  const ImageDogPage({super.key});

  @override
  State<ImageDogPage> createState() => _ImageDogPageState();
}

class _ImageDogPageState extends State<ImageDogPage>{
  final DogBloc _dogBloc = DogBloc();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
          onPressed: (){
        _dogBloc.add(GetDogImageEvent());
      },
      ),
      body: Center(
        child: BlocBuilder<DogBloc, DogState>(
        bloc: _dogBloc,
        buider: (context, state) {
          if(state is LoadedDogImageState){
            return Image.network(
                state.img,
            loadingBuilder: (context, child, loadingProgress){
                  if (loadingProgress == null) return child;
                  return const Center(
                    child:  CircularProgressIndicator.adaptive(),
                  );
            },
            );
          }
          if(state is ErrorDogState){
            return Text('Ошибка загрузки', style: TextStyle(fontSize: 50) );
          }
          if(state is LoadingDogState){
            return CircularProgressIndicator.adaptive();
          }
          return Text('Initial State');
        }
      ),),
    );
  }
}