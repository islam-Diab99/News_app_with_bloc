
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/News_app/cubit/cubit.dart';
import 'package:news/News_app/cubit/states.dart';
import 'package:news/components/article%20item.dart';

class SearchScrean extends StatelessWidget {
   SearchScrean({Key? key}) : super(key: key);
   var searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,states){},
      builder:(context,states){
        var list =NewsCubit.get(context).search;
      return  Scaffold(
        appBar: AppBar(),
        body:Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: defaulfFormField(
                  controller: searchController,
                  inputType: TextInputType.text,
                  onChange: (String value){
                    NewsCubit.get(context).getSearch(value);
                  },

                  validate: (String? value){
                    if(value!.isEmpty)
                    {
                      return 'search must be not empty';
                    }
                    return null;

                  },
                  labelText: 'Search',
                  prifix: Icons.search
              ),
            ),

         (list.isNotEmpty)?
             
        Expanded(
          child: ListView.separated(

          physics: BouncingScrollPhysics(),
          itemBuilder:

          (context,index){

          return BuildArticleItem(list [index],context);},
          separatorBuilder: (context,index){return Divider(endIndent: 40,indent: 40,);},
          itemCount: list.length),
        ):
        Center(child: Container()),
          ],
        ) ,
      );
      } ,

    );
  }
}
Widget defaulfFormField({
  required TextEditingController controller,
  @required TextInputType? inputType,
  var onSubmit,
  var onChange,
  var onTap,
  String? labelText,

  required String? validate(String? value)?,
  IconData? prifix,}){
  return TextFormField(
    controller:  controller,
    keyboardType: inputType,
    onFieldSubmitted:onSubmit ,
    onChanged: onChange,
    validator: validate,
    onTap: onTap,
    decoration: InputDecoration(
      labelText:labelText,
      prefixIcon: Icon(
          prifix
      ),
      border: OutlineInputBorder(),

    ),
    focusNode:FocusNode() ,
  );
}
