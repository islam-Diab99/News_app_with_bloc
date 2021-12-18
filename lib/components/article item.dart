

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news/News_app/models/modules/web_view.dart';
import 'package:news/components/navigation.dart';


Widget BuildArticleItem( article ,context)=>InkWell(
  onTap: (){
    navigateTo(context, WebViewScrean(url: article['url']));
  },
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [



        ClipRRect(

          borderRadius: BorderRadius.circular(13),

          child: Container(

            height: 120,

            width: 120,



            child: FadeInImage(

              image: NetworkImage('${article['urlToImage']}'),

              placeholder: AssetImage('images/img_1.png'

              ),

              imageErrorBuilder: (context,error,stackTracer){

                return Image.asset('images/img.png');

              },

              fit: BoxFit.cover,



            ),



            decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(10),







            ),



          ),

        ),

        SizedBox(width: 20,),



        Expanded(

          child: Container(

            height: 120,

            child: Column(

              mainAxisSize: MainAxisSize.min,

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Expanded(

                  child: Text('${article['title']}',

                    style:Theme.of(context).textTheme.bodyText1,

                    maxLines: 3,

                    overflow: TextOverflow.ellipsis,



                  ),

                ),

                Text('${article['publishedAt']}',style: TextStyle(



                    color: Colors.grey

                ),



                ),



              ],

            ),

          ),

        )

      ],

    ),

  ),
);