import 'package:api_with_dio/layout/cubit/state.dart';
import 'package:api_with_dio/models/news_model.dart';
import 'package:api_with_dio/shared/component/component.dart';
import 'package:api_with_dio/shared/network/remote/dio_helper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/cubit.dart';

class Businessscreen extends StatelessWidget {
  const Businessscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      builder: ( context, state) { 
        var lit = NewsCubit.get(context).BuisnesList?.articles;
      return  Scaffold(
      body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                Text(
                  "Breaking News",
                  style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                   state is NewsBusinessgState? Center(child: CircularProgressIndicator()):
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
                  style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Column( children:
            state is NewsBusinessgState ?[Center(child: CircularProgressIndicator())] :lit!.map((e) => newList_till(e)).toList())
              ])
              )
              
              ),
    );
     }, 
    listener: ( context,state) {  },);
  }
}
