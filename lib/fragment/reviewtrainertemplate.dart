import 'package:flutter/material.dart';

class ReviewTrainerTemplate extends StatelessWidget {
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
      body: Container(
        margin: EdgeInsets.all(30),
        decoration: BoxDecoration(
            border: Border.all(color: Color(0XFF2CB3BF),width: 1),
            borderRadius: BorderRadius.circular(6)
        ),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text("TEMPLATE 1",style: TextStyle(
                  fontSize: 18*MediaQuery.of(context).textScaleFactor,
                  fontWeight: FontWeight.w600,
                  color: Color(0XFF2CB3BF)
              ),),
              subtitle: Text("Monday  10 May 2021 12:57 PM",style: TextStyle(
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

            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.access_time,size: 19,color: Colors.redAccent,),
                      SizedBox(width: 3,),
                      Text("12:57 MIN",style: TextStyle(
                          fontSize: 12*MediaQuery.of(context).textScaleFactor,
                          fontWeight: FontWeight.w600,
                          color: Color(0XFF262626)
                      ),),
                    ],
                  ),
                  SizedBox(width: 14,),
                  Row(
                    children: [
                      Icon(Icons.expand,size: 19,color: Colors.redAccent,),
                      SizedBox(width: 3,),
                      Text("5060 KG",style: TextStyle(
                          fontSize: 12*MediaQuery.of(context).textScaleFactor,
                          fontWeight: FontWeight.w600,
                          color: Color(0XFF262626)
                      ),),
                    ],
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15,top: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("CHEST DAY 1",style: TextStyle(
                    fontSize: 15*MediaQuery.of(context).textScaleFactor,
                    fontWeight: FontWeight.normal,
                    color: Color(0XFF2CB3BF)
                ),),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15,top: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("BENCH PRESS",style: TextStyle(
                    fontSize: 15*MediaQuery.of(context).textScaleFactor,
                    fontWeight: FontWeight.w600,
                    color: Color(0XFF262626)
                ),),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'W',
                          style: TextStyle(color: Color(0XFF2CB3BF),
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                          /*recognizer: TapGestureRecognizer()..onTap = () {
                            // Single tapped.
                          },*/
                        ),
                        TextSpan(
                            text: ' 12 KGX5',
                            style: TextStyle(color: Color(0XFF262626),
                                fontSize: 15,
                                fontWeight: FontWeight.w600)
                            // recognizer:  DoubleTapGestureRecognizer()..onDoubleTap = () {
                            //   // Double tapped.
                            // }
                        ),
                      ],
                    ),
                  ),

                  Text("60 KG",
                      style: TextStyle(color: Color(0XFF262626),
                          fontSize: 15,
                          fontWeight: FontWeight.w600))

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'W',
                          style: TextStyle(color: Color(0XFF2CB3BF),
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                          /*recognizer: TapGestureRecognizer()..onTap = () {
                            // Single tapped.
                          },*/
                        ),
                        TextSpan(
                            text: ' 12 KGX5',
                            style: TextStyle(color: Color(0XFF262626),
                                fontSize: 15,
                                fontWeight: FontWeight.w600)
                          // recognizer:  DoubleTapGestureRecognizer()..onDoubleTap = () {
                          //   // Double tapped.
                          // }
                        ),
                      ],
                    ),
                  ),

                  Text("60 KG",
                      style: TextStyle(color: Color(0XFF262626),
                          fontSize: 15,
                          fontWeight: FontWeight.w600))

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'W',
                          style: TextStyle(color: Color(0XFF2CB3BF),
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                          /*recognizer: TapGestureRecognizer()..onTap = () {
                            // Single tapped.
                          },*/
                        ),
                        TextSpan(
                            text: ' 12 KGX5',
                            style: TextStyle(color: Color(0XFF262626),
                                fontSize: 15,
                                fontWeight: FontWeight.w600)
                          // recognizer:  DoubleTapGestureRecognizer()..onDoubleTap = () {
                          //   // Double tapped.
                          // }
                        ),
                      ],
                    ),
                  ),

                  Text("60 KG",
                      style: TextStyle(color: Color(0XFF262626),
                          fontSize: 15,
                          fontWeight: FontWeight.w600))

                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(left: 15,top: 40),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("CHEST FLY",style: TextStyle(
                    fontSize: 15*MediaQuery.of(context).textScaleFactor,
                    fontWeight: FontWeight.w600,
                    color: Color(0XFF262626)
                ),),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'W',
                          style: TextStyle(color: Color(0XFF2CB3BF),
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                          /*recognizer: TapGestureRecognizer()..onTap = () {
                            // Single tapped.
                          },*/
                        ),
                        TextSpan(
                            text: ' 12 KGX5',
                            style: TextStyle(color: Color(0XFF262626),
                                fontSize: 15,
                                fontWeight: FontWeight.w600)
                          // recognizer:  DoubleTapGestureRecognizer()..onDoubleTap = () {
                          //   // Double tapped.
                          // }
                        ),
                      ],
                    ),
                  ),

                  Text("60 KG",
                      style: TextStyle(color: Color(0XFF262626),
                          fontSize: 15,
                          fontWeight: FontWeight.w600))

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'W',
                          style: TextStyle(color: Color(0XFF2CB3BF),
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                          /*recognizer: TapGestureRecognizer()..onTap = () {
                            // Single tapped.
                          },*/
                        ),
                        TextSpan(
                            text: ' 12 KGX5',
                            style: TextStyle(color: Color(0XFF262626),
                                fontSize: 15,
                                fontWeight: FontWeight.w600)
                          // recognizer:  DoubleTapGestureRecognizer()..onDoubleTap = () {
                          //   // Double tapped.
                          // }
                        ),
                      ],
                    ),
                  ),

                  Text("60 KG",
                      style: TextStyle(color: Color(0XFF262626),
                          fontSize: 15,
                          fontWeight: FontWeight.w600))

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'W',
                          style: TextStyle(color: Color(0XFF2CB3BF),
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                          /*recognizer: TapGestureRecognizer()..onTap = () {
                            // Single tapped.
                          },*/
                        ),
                        TextSpan(
                            text: ' 12 KGX5',
                            style: TextStyle(color: Color(0XFF262626),
                                fontSize: 15,
                                fontWeight: FontWeight.w600)
                          // recognizer:  DoubleTapGestureRecognizer()..onDoubleTap = () {
                          //   // Double tapped.
                          // }
                        ),
                      ],
                    ),
                  ),

                  Text("60 KG",
                      style: TextStyle(color: Color(0XFF262626),
                          fontSize: 15,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
