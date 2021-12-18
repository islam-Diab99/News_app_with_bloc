
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/News_app/cubit/cubit.dart';
import 'package:news/News_app/cubit/states.dart';
import 'package:news/components/article%20item.dart';
class ScienceScrean extends StatelessWidget {
  const ScienceScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context,state){},
      builder: (context,state){
        var list =NewsCubit.get(context).science;
        return (list.isNotEmpty)?
        ListView.separated(

            physics: BouncingScrollPhysics(),
            itemBuilder:

                (context,index){

              return BuildArticleItem(list [index],context);},
            separatorBuilder: (context,index){return Divider(endIndent: 40,indent: 40,);},
            itemCount: 10):
        Center(child: CircularProgressIndicator());
      },

    );
  }
}
