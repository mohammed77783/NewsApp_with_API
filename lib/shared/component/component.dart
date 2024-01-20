



import 'package:flutter/material.dart';

import '../../models/news_model.dart';

Widget defultbutton({
 required Color cl,
 required double width
})=>Container();


Widget newList_till (date)=>
InkWell( onTap: (){
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 20.0),
        padding: EdgeInsets.all(12.0),
        height: 130,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(26.0)),
        child: Row(children: [
          Flexible(
              flex: 3,
              child: Container(
                height: 100.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    image: DecorationImage(
                        image: NetworkImage('${date.urlToImage}'),
                        fit: BoxFit.fitHeight)),
              )),
          SizedBox(
            width: 10.0,
          ),
          Flexible(
            flex: 5,
            child: Column(
              children: [
                Flexible(
                  flex: 3,
                  child: Text(
                  '${date.title}',
                    style:
                        TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Flexible(
                  flex: 1,
                  child: Text( 
                   '${date.content}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white54),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
 



 Widget breaking_new_card(data)=> InkWell(
      onTap: (){
        },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            image: DecorationImage(
                fit: BoxFit.fill, image: NetworkImage(data.urlToImage))),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
              data.title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
               data.author,
                style: TextStyle(
                    color: Colors.white54,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),
    
            ],
          ),
        ),
      ),
    );
