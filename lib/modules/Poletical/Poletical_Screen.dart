









import 'package:api_with_dio/layout/cubit/cubit.dart';
import 'package:api_with_dio/layout/cubit/state.dart';
import 'package:api_with_dio/shared/component/component.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Poleticalscreen extends StatelessWidget {
   Poleticalscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   BlocConsumer<NewsCubit, NewsState>(
      builder: ( context, state) { 
      
                    var lit = NewsCubit.get(context).GenerallList?.articles;
      return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Breaking News",
                style:  Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 20,
              ),
                    state is NewsgeneralgState? Center(child: CircularProgressIndicator()):
                                CarouselSlider.builder(
                            itemCount: 5,
                            itemBuilder: (context, index, id) =>
                                breaking_new_card(lit![index]),
                            options: CarouselOptions(
                                aspectRatio: 16 / 9,
                                enableInfiniteScroll: false,
                                enlargeCenterPage: true)),

                   SizedBox(
                  height: 40.0,
                ),
                Text(
                  "Recent News",
                  style:  Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Column( children:
            state is NewsgeneralgState ?[Center(child: CircularProgressIndicator())] :lit!.map((e) => newList_till(e)).toList())
              ])
              )
              
              ),
    );
     }, 
    listener: ( context,state) {  },);

  }
}