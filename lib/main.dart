import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/News_app/News_layout.dart';
import 'package:news/News_app/cubit/cubit.dart';
import 'package:news/News_app/cubit/states.dart';
import 'package:news/components/Network/cashe_helper.dart';
import 'package:news/components/Network/dio_helper.dart';

import 'News_app/cubit/bloc_observer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer=MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool? isDark=CacheHelper.getData(key: "isDark");
  runApp( MyApp(isDark));
}

class MyApp extends StatelessWidget {
  var isDark;



   MyApp(this.isDark,{Key? key, }) : super(key: key);


   

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>NewsCubit()..changeTheme(
            shared: isDark
        )..getBusiness(),)
      ],
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener:(context,state){} ,
        builder: (context,states)
        {
         return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              primaryColor: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.black),
                  color: Colors.white,
                  elevation: 0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
                unselectedItemColor: Colors.grey,
                selectedItemColor: Colors.deepOrange,
                type: BottomNavigationBarType.fixed,
              ),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor('333739'),
              primarySwatch: Colors.deepOrange,
              primaryColor: Colors.deepOrange,
              textTheme: TextTheme(
                bodyText1: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              appBarTheme: AppBarTheme(

                iconTheme: IconThemeData(color: Colors.white),
                color: HexColor('333739'),
                elevation: 0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,
                ),
                titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: HexColor('333739'),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: HexColor('333739'),
                unselectedItemColor: Colors.grey,
                selectedItemColor: Colors.deepOrange,
                type: BottomNavigationBarType.fixed,
              ),
            ),
            themeMode: NewsCubit.get(context).isDark
                ? ThemeMode.light
                : ThemeMode.dark,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}

