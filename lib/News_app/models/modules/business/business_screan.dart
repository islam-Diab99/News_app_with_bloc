
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/News_app/cubit/cubit.dart';
import 'package:news/News_app/cubit/states.dart';
import 'package:news/components/article%20item.dart';
class BusinessScrean extends StatelessWidget {
  const BusinessScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context,state){},
        builder: (context,state){
          var list =NewsCubit.get(context).business;
        return (state is! NewsGetBusinessLoadingState)?
           ListView.separated(

             physics: BouncingScrollPhysics(),
               itemBuilder:

           (context,index){

               return BuildArticleItem(list [index],context);},
               separatorBuilder: (context,index){return Divider(endIndent: 40,indent: 40,);},
               itemCount: list.length):
          Center(child: CircularProgressIndicator());
        },

    );
  }
}
