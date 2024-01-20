import 'package:api_with_dio/layout/cubit/cubit.dart';
import 'package:api_with_dio/layout/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class News_layout extends StatelessWidget {
  const News_layout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(title: Text('News App'),actions: [
              IconButton(onPressed: (){ 
              }, icon: Icon(Icons.search))
         ,    IconButton(onPressed: (){
                cubit.changeThememode();
              
              }, icon: Icon(Icons.dark_mode))
            ],),
            body: cubit.Screens[cubit.currentindex],
            bottomNavigationBar: Container(
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.black, 
                borderRadius: BorderRadius.circular(16)),
            child:BottomNavigationBar(
                        items: cubit.bottomItems,
                        currentIndex: cubit.currentindex,
                        onTap: (index) {
                          cubit.change_index(index);
                        },
                      ),   ),
              );
                });
  }
}
