import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tws/apiService/apiResponse/ResponseFetchWorkoutId.dart';
import 'package:tws/apiService/apimanager.dart';
import 'package:tws/screen/addnewexercise.dart';
import 'package:tws/screen/subcategorydetail.dart';
import 'package:tws/screen/videothumbnail.dart';
import 'package:tws/screen/youtubescreen.dart';

class SubCategory extends StatefulWidget {

  /*final String name;

  SubCategory();*/

  @override
  _SubCategoryState createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0XFF2CB3BF),
        title: Text("ss",style: TextStyle(
            color: Colors.white
        ),),
        leading: Icon(Icons.arrow_back,color: Colors.white,),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddNewExerCise()));
            },
              child: Container(
                  width: 25,
                  margin: EdgeInsets.only(right: 10),
                  height: 25,
                  child: Image.asset("assets/images/add.png",color: Colors.white,)))
        ],),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 60,
                child: Center(
                  child: Text("Please select category to add exercise",style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color(0XFF2CB3BF)
                  ),),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  enabled: false,
                  onSaved: (value){},
                  keyboardType: TextInputType.text,
                  maxLength: 25,
                  maxLines: 1,
                  onChanged: (String value){},
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                    border: InputBorder.none,
                    hintText: 'Search here',
                    filled: true,
                    counterText: "",
                    prefixIcon: Icon(Icons.search),
                    fillColor: Color(0xFFEBF0F3),
                    enabledBorder : OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.white12),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.white12),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.white12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.white12),
                    ),
                  ),
                ),
              ),

              FutureBuilder(
                future: Provider.of<ApiManager>(context,listen: false).fetchExerciseByWorkOutId(),
                  builder: (context,snapshots){
                    if(snapshots.connectionState == ConnectionState.waiting)
                      return Container(
                        height: MediaQuery.of(context).size.height*0.66,
                        child: Center(
                          child: CircularProgressIndicator(),),
                      );
                    else if (snapshots.hasError) {
                      return Text("${snapshots.error}");}
                    else{
                      if(snapshots.hasData){
                        ResponseFetchWorkoutCategoryId response = snapshots.data;
                        List<Data> data = response.data;
                        return response.errorCode == 0 ? Container(
                          height: MediaQuery.of(context).size.height*0.66,
                            child: Center(child: Text("No workout added",
                              style: TextStyle(
                                  fontFamily: "Proxima Nova",
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 20*MediaQuery.of(context).textScaleFactor
                              ),))) : Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: data.length,
                              itemBuilder: (context,index){
                                return GestureDetector(
                                  onTap: (){
                                    if(data[index].youTubeLink == ""){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SubCategoryDetail(video:data[index].video,description:data[index].description,name:data[index].name)));
                                    }else{
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => VideoApp(youtubelink:data[index].youTubeLink,description:data[index].description,name:data[index].name)));
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image.asset("assets/images/spalsh.jpg",
                                              width: MediaQuery.of(context).size.width,
                                              height: 165,fit: BoxFit.cover,)),
                                        Positioned(
                                            bottom: 15,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 13),
                                              child: Text(data[index].name,style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600
                                              ),),
                                            )),

                                        /*Positioned(
                              top: 15,
                              right: 15,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 13),
                                child: Text("Beginner",style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600
                                ),),
                              ),),*/
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        );
                      }else{
                        return Center(child: Text("No workout added",
                          style: TextStyle(
                              fontFamily: "Proxima Nova",
                              fontWeight: FontWeight.w600,
                              fontSize: 20*MediaQuery.of(context).textScaleFactor
                          ),),);
                      }
                    }
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}