import 'package:api_with_dio/layout/cubit/state.dart';
import 'package:api_with_dio/models/news_model.dart';
import 'package:api_with_dio/modules/Business/Businessscreen.dart';
import 'package:api_with_dio/modules/Poletical/Poletical_Screen.dart';
import 'package:api_with_dio/modules/Science/Scienc.dart';
import 'package:api_with_dio/modules/Setting/Setting_screen.dart';
import 'package:api_with_dio/shared/network/remote/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modules/Sport/Sport.dart';
import '../../shared/component/constaint.dart';
class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(Newsinitialstate());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentindex = 0;
    news_model? BuisnesList ;
 news_model? BuisnesListBreak;
news_model? GenerallList ;
news_model? SportlList ;
news_model? ScientecList ;
  void change_index(int index) async{
    currentindex = index;
     if(index==0){
      emit(NewsBottomNavState());
   
    }
  else  if(index==1){
     await getBuisnesDate();
   
    }
    else if(index==2){
   await getSportDate();
   
    }
    else if(index==3){
    await  getscienceDate();
    }
    else if(index==4){
      emit(NewsBottomNavState());
    }
  }
  List<BottomNavigationBarItem> bottomItems = [ 
     BottomNavigationBarItem( icon: Icon(Icons.public), label: 'general', backgroundColor: Colors.transparent),
    BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: 'Business',
        backgroundColor: Colors.transparent),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports', backgroundColor: Colors.transparent),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science', backgroundColor: Colors.transparent),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings', backgroundColor: Colors.transparent),
  ];

  List<Widget> Screens = [
    Poleticalscreen(),
    Businessscreen(),
    Sportscreen(),
    Sciensscreen(),
    Setting_Screen()
   
  ];

  getscienceDate() {
    emit(NewsgetscienceState());
   // print('=============================statr+++==================================');
    Diohelper.getdate(url:method, query: {
      'category': 'science',
      'country': 'us',
      'apiKey': apiKey
    }).then((value) {
      ScientecList =news_model.fromJson(value.data);
      emit(NewsgetscienceSuccessstate());
    }).catchError((error) {
          emit(NewsgetscienceErrorstate(error.toString()));
          print('-----------------------------------------erore___________________---------------------------');
      print(error);
    });
  }

  getSportDate() {
    emit(NewsgetSportState());
   // print('=============================statr+++==================================');
    Diohelper.getdate(url:method, query: {
      'category': 'sports',
      'country': 'us',
      'apiKey': apiKey
    }).then((value) {
      SportlList =news_model.fromJson(value.data);
      emit(NewsgeSportSuccessstate());
    }).catchError((error) {
          emit(NewsgetSportErrorstate(error.toString()));
    });
  }




  getGeneralDate() {
    emit(NewsgeneralgState());
    Diohelper.getdate(url:method, query: {
      'category': 'general',
      'country': 'us',
      'apiKey': apiKey
    }).then((value) {
      GenerallList =news_model.fromJson(value.data);
      emit(NewsgetgeneralSuccessstate());
    }).catchError((error) {
          emit(NewsgetgeneralErrorstate(error.toString()));
    });
  }
  

  getBuisnesDate()async {
    emit(NewsBusinessgState());
   await Diohelper.getdate(url:method, query: {
      'category': 'business',
      'country': 'us',
      'apiKey': apiKey
    }).then((value) {
      print('===========================================then');
      BuisnesList =news_model.fromJson(value.data);
      emit(NewsgetBusinessSuccessstate());
    }).catchError((error) {
          emit(NewsgetBusinessErrorstate(error.toString()));
         
    });
    print('=======------------------------------------------------------------');

  }


   getBuisnesBreakingDate() {
    emit(NewsbreakingLoadingState());
    Diohelper.getdate(url:method, query: {
      'category': 'business',
      'country': 'us',
      'pageSize':'5',
      'apiKey': apiKey
    }).then((value) {
      BuisnesListBreak =news_model.fromJson(value.data);
      emit(NewsgetBusinessBreakingSuccessstate());
    }).catchError((error) {
        emit(NewsgetBusinessBreakingErrorstate(error.toString()));
      print(error);
    });
  }



bool? isdark=false;
  void changeThememode(){
  isdark= !isdark!;
  print(isdark);
  emit(changthemmodeState());
  }


}
