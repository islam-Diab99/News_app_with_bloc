import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/News_app/cubit/states.dart';
import 'package:news/News_app/models/modules/business/business_screan.dart';
import 'package:news/News_app/models/modules/science/science_screan.dart';
import 'package:news/News_app/models/modules/settings/settings_screan.dart';
import 'package:news/News_app/models/modules/sports/sports_screan.dart';
import 'package:news/components/Network/cashe_helper.dart';
import 'package:news/components/Network/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialStates());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List screans = [
    BusinessScrean(),
    SportsScrean(),
    ScienceScrean(),
    SettingsScrean()
  ];

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.shopping_bag,
        ),
        label: 'Business'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sports_football,
        ),
        label: 'Sports'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
        ),
        label: 'Science'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.settings,
        ),
        label: 'Settings'),
  ];
  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) getSports();
    if (index == 2) getScience();
    emit(NewsBottomNavStates());
  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getdata(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '0200a463afec4015aff23b7d45d9e14a'
      },
    ).then((value) {
      business = value.data['articles'];
      print(value.data['articles']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErorrState(error.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsLoadingState());
    DioHelper.getdata(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '0200a463afec4015aff23b7d45d9e14a'
      },
    ).then((value) {
      sports = value.data['articles'];
      print(value.data['articles']);
      emit(NewsGetSportsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSportsErorrState(error.toString()));
    });
  }

  List<dynamic> science = [];
  void getScience() {
    emit(NewsGetScienceLoadingState());
    DioHelper.getdata(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '0200a463afec4015aff23b7d45d9e14a'
      },
    ).then((value) {
      science = value.data['articles'];
      print(value.data['articles']);
      emit(NewsGetScienceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetScienceErorrState(error.toString()));
    });
  }

  List<dynamic> search = [];
  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    DioHelper.getdata(
      url: 'v2/everything',
      query: {'q': '$value', 'apiKey': '0200a463afec4015aff23b7d45d9e14a'},
    ).then((value) {
      search = value.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErorrState(error.toString()));
    });
  }

  bool isDark = false;
  void changeTheme({bool? shared}) {
    if (shared != null) {
      isDark = shared;
    } else
      isDark = !isDark;
    CacheHelper.putData(key: 'isDark', value: isDark)
        .then((value) => emit(NewsChangeModeState()));
  }
}
