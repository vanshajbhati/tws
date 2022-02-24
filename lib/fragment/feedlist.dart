import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tws/apiService/apiResponse/ResponseFetchBlog.dart';
import 'package:tws/apiService/apimanager.dart';
import 'package:tws/fragment/feedlistdetail.dart';
import 'package:tws/screen/editBlog.dart';

class FeedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0XFF2CB3BF),
        title: Text("Feeds",style: TextStyle(
            color: Colors.white
        ),),
        leading: Icon(Icons.arrow_back,color: Colors.white,),),
      body: FutureBuilder(
        future: Provider.of<ApiManager>(context).fetchBlogApi(),
        builder: (context,snapshots){
          if(snapshots.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),);
          else if (snapshots.hasError) {
            return Text("${snapshots.error}");}
          else{
            if(snapshots.hasData){
              ResponseFetchBlog response = snapshots.data;
              List<DataFetchBlog> data = response.data;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context,index){
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){

                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> FeedListDetail(image:data[index].video,title:data[index].title,description:data[index].description)));
                        },
                        child: Card(
                          elevation: 15,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[

                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network("http://fitnessapp.frantic.in/"+data[index].video,height: 185,fit: BoxFit.cover,width: MediaQuery.of(context).size.width,),),

                                SizedBox(height: 10,),

                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(data[index].title,style: TextStyle(
                                      fontSize: 19*MediaQuery.of(context).textScaleFactor,
                                      color: Color(0XFF4B4B4B),
                                      fontWeight: FontWeight.normal
                                  ),),
                                ),

                                SizedBox(height: 5,),

                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(data[index].description,style: TextStyle(
                                      color: Color(0XFF737373),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15
                                  ),),
                                ),

                                SizedBox(height: 7,),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => FeedsEdit(heading:data[index].title,description:data[index].description,id:data[index].id,image:data[index].video)));
                                      },
                                        child: Image.asset("assets/images/edits.png",width: 22,height: 22,)),
                                    SizedBox(width: 25,),
                                    Image.asset("assets/images/delets.png",width: 22,height: 22,),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                  );
                },
              );
            }else{
              return Center(child: Text("No feeds added yet",
                style: TextStyle(
                    fontFamily: "Proxima Nova",
                    fontWeight: FontWeight.w600,
                    fontSize: 20*MediaQuery.of(context).textScaleFactor
                ),),);
            }
          }
        },

      ),
    );
  }
}