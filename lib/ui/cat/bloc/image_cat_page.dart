import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cat_bloc.dart';

class ImageCatPage extends StatefulWidget {
  const ImageCatPage({super.key});

  @override
  State<ImageCatPage> createState() => _ImageCatPageState();
}

class _ImageCatPageState extends State<ImageCatPage>{
  final CatBloc _catBloc = CatBloc();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
          onPressed: (){
        _catBloc.add(GetCatImageEvent());
      },
      ),
      body: Center(
        child: BlocBuilder<CatBloc, CatState>(
        bloc: _catBloc,
        builder: (context, state) {
          if(state is LoadedCatImageState){
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
          if(state is ErrorCatState){
            return Text('Ошибка загрузки', style: TextStyle(fontSize: 50) );
          }
          if(state is LoadingCatState){
            return CircularProgressIndicator.adaptive();
          }
          return Text('Initial State');
        }
      ),),
    );
  }
}