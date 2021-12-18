
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/News_app/cubit/cubit.dart';
import 'package:news/News_app/cubit/states.dart';
import 'package:news/News_app/models/modules/search/search_screan.dart';
import 'package:news/components/Network/dio_helper.dart';
import 'package:news/components/navigation.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,states)=>{},
      builder: (BuildContext context, state) {
        var cubit =NewsCubit.get(context);
        return  Scaffold(

          body: cubit.screans[cubit.currentIndex],
          appBar: AppBar(
            titleSpacing: 20,
            actions: [
              IconButton(onPressed: (){
                navigateTo(context,SearchScrean());
              }, icon: Icon(
                Icons.search,


              )),
              IconButton(onPressed: ()
              {
                cubit .changeTheme();
                print('${NewsCubit.get(context).isDark}');
              }, icon: Icon(
                Icons.brightness_4_outlined,



              ))
            ],


            title: Text('News App'),

          ),
          bottomNavigationBar: BottomNavigationBar(

             items:
             cubit.bottomItems,

            currentIndex: cubit.currentIndex,
            elevation: 50,
            onTap: (index){cubit.changeBottomNavBar(index);



            },
          ),
        );
      },

    );
  }
}
