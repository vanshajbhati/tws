import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tws/apiService/AppConstant.dart';
import 'package:tws/apiService/apiResponse/ResponseFetchWorkout.dart';
import 'package:tws/apiService/apimanager.dart';
import 'package:tws/apiService/sharedprefrence.dart';
import 'package:tws/screen/addcategory.dart';
import 'package:tws/screen/addnewexercise.dart';
import 'package:tws/screen/subcategory.dart';

class WorkOut extends StatefulWidget {
  @override
  _WorkOutState createState() => _WorkOutState();
}

class _WorkOutState extends State<WorkOut> {
  
  ScrollController scrollController = new ScrollController();
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',];

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width *3.5 ;
    double cardHeight = MediaQuery.of(context).size.height * 2.3;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0XFF2CB3BF),
        title: Text("MY WORK OUT",style: TextStyle(
            color: Colors.white,
        ),),
        leading: Icon(Icons.arrow_back,color: Colors.white,),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddCategory()));
              },
                child: Container(
                    width: 25,
                    height: 25,
                    child: Image.asset("assets/images/add.png",color: Colors.white,))),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            Container(
              margin: EdgeInsets.only(top:10.0),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height*0.28,
                  disableCenter: true,
                  aspectRatio: 16/9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.ease,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
                items: imgList.map((item) => Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 2.0),
                  child: Image.network(item, fit: BoxFit.cover,),
                )).toList(),
              ),
            ),

            SizedBox(height: 20,),

            FutureBuilder(
              future: Provider.of<ApiManager>(context).fetchWorkOutApi(),
                builder: (context,snapshots){
                if(snapshots.connectionState == ConnectionState.waiting)
                  return Center(
                    child: CircularProgressIndicator(),);
                else if (snapshots.hasError) {
                  return Text("${snapshots.error}");}
                else{
                  if(snapshots.hasData){
                    ResponseFetchWorkOut response = snapshots.data;
                    List<Data> data = response.data;
                    return response.errorCode == 0 ? Center(child: Text("No workout added",
                        style: TextStyle(
                        fontFamily: "Proxima Nova",
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 20*MediaQuery.of(context).textScaleFactor
                    ),)) :
                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: cardWidth/cardHeight,
                              crossAxisSpacing:10
                          ),
                          scrollDirection: Axis.vertical,
                          controller: scrollController,
                          itemCount: data.length,
                          itemBuilder: (context, index) {return GestureDetector(
                            onTap: ()async{
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SubCategory()));
                              await SharedPrefManager.savePrefString(AppConstant.WORKOUTID, response.data[index].id);
                              await SharedPrefManager.savePrefString(AppConstant.NAMECATEGORY, response.data[index].name);
                            },
                            child: Stack(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height*0.28,
                                  width:MediaQuery.of(context).size.width,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network("http://fitnessapp.frantic.in/"+data[index].image,fit: BoxFit.cover,)),
                                  decoration: BoxDecoration(
                                    // color: Color(0XFFCDFFCC),
                                    borderRadius: BorderRadius.circular(10),),),

                                Positioned(
                                  bottom: 25,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.transparent
                                    ),
                                    child: Column(
                                      children: [
                                        // Container(height: 2,color: Colors.green,
                                        //   width: 55,
                                        //   margin: EdgeInsets.only(bottom: 5,top: 5),
                                        // ),
                                        Card(
                                          elevation: 4,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 10,top: 2,right: 10,bottom: 2),
                                            child: Text(data[index].name,style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],),
                          );
                          }
                      ),
                    );
                  }else{
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Center(child: Text("No workout added",
                        style: TextStyle(
                            fontFamily: "Proxima Nova",
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 20*MediaQuery.of(context).textScaleFactor
                        ),),),
                    );
                  }
                }
              }
            ),
          ],
        ),
      ),
    );
  }
}