import 'package:flutter/material.dart';
import 'package:tws/fragment/reviewtrainertemplate.dart';

class ReviewClientWorkOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.arrow_back,color: Colors.white,),
        backgroundColor: Color(0XFF2CB3BF),
        title: Text("REVIEW CLIENT WORKOUT",style: TextStyle(
            fontSize: 18*MediaQuery.of(context).textScaleFactor,
            color: Colors.white
        ),),
      ),
      body: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        itemBuilder: (context,index){
          return Container(
            // padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0XFF2CB3BF),width: 1),
              borderRadius: BorderRadius.circular(6)
            ),
            child: ListTile(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ReviewTrainerTemplate()));},
              title: Text("TEMPLATE 1",style: TextStyle(
                fontSize: 18*MediaQuery.of(context).textScaleFactor,
                fontWeight: FontWeight.w600,
                color: Color(0XFF2CB3BF)
              ),),
              subtitle: Text("M10 May 2021",style: TextStyle(
                  fontSize: 13*MediaQuery.of(context).textScaleFactor,
                  fontWeight: FontWeight.w600,
                  color: Color(0XFF262626)
              ),),
              trailing: Container(
                width: 53,
                child: Row(
                  children: [
                    Icon(Icons.keyboard_arrow_down_outlined,
                    color: Color(0XFF2CB3BF),),

                    SizedBox(width: 5,),

                    Icon(Icons.more_vert)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}