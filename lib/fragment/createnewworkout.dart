import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tws/apiService/AppConstant.dart';
import 'package:tws/apiService/apiResponse/ResponseFetchClientWorkout.dart';
import 'package:tws/apiService/sharedprefrence.dart';
import 'package:tws/fragment/addexercise.dart';
import 'package:tws/fragment/newaddsetworkouttemplate.dart';
import 'package:tws/fragment/newworkouttemplate.dart';
import 'package:provider/provider.dart';
import 'package:tws/apiService/apimanager.dart';

class CreateNewWorkOut extends StatefulWidget {
  @override
  _CreateNewWorkOutState createState() => _CreateNewWorkOutState();
}

class _CreateNewWorkOutState extends State<CreateNewWorkOut> {

  String tag = "";
  TextEditingController workOutController = TextEditingController();
  bool _isLoad = false;

  void _trySubmit()async{
    if(workOutController.text.isEmpty){
      Fluttertoast.showToast(msg: "Enter workout",
          gravity: ToastGravity.BOTTOM);
    }else{
      setState(() {
        _isLoad = true;
      });
      await Provider.of<ApiManager>(context,listen: false).createNewWorkOutApi(workOutController.text, selectedDate.toString(), selectedDate.toString());
      tag = "CreateMeal";
      workOutController.clear();
      setState(() {
        _isLoad = false;
      });
    }
  }

  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2035),);

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  DateTime selectedEndDate = DateTime.now();

  _selectEndDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedEndDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2035),);

    if (picked != null && picked != selectedEndDate)
      setState(() {
        selectedEndDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.arrow_back,color: Colors.white,),
        backgroundColor: Color(0XFF2CB3BF),
        title: Text("CREATE NEW WORKOUT",style: TextStyle(
            fontSize: 16*MediaQuery.of(context).textScaleFactor,
            color: Colors.white
        ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(top:20,bottom: 20,right: 20,left: 20),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,),],
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: <Widget>[

                    Row(
                      children: [

                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left:10.0),
                              child: Text("Date",style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0XFF2CB3BF)
                              ),),
                            ),
                          ),
                        ),

                        /*Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("To",style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0XFF2CB3BF)
                              ),),
                            ),
                          ),
                        ),*/
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: (){
                              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateNewdiet()));
                            },
                            child: Container(
                              height:50,
                              margin: EdgeInsets.only(top: 8),
                              /*decoration:BoxDecoration(
                                            border:Border.all()),*/
                              child: RaisedButton(
                                onPressed: () => _selectDate(context), // Refer step 3
                                child: selectedDate == null?Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("From")):Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                                    style: TextStyle(color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize:13
                                    ),
                                  ),
                                ),
                                color: Colors.white,
                              ),
                            ),
                          ),),

                        /*SizedBox(width: 20,),

                        Expanded(
                          flex: 1,
                          child: Container(
                            height:50,
                            margin: EdgeInsets.only(top: 8),
                            child: RaisedButton(
                              onPressed: () => _selectEndDate(context), // Refer step 3
                              child:selectedEndDate==null?Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("To")):Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${selectedEndDate.day}/${selectedEndDate.month}/${selectedEndDate.year}',
                                  style: TextStyle(color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize:13
                                  ),
                                ),
                              ),
                              color: Colors.white,
                            ),
                          ),
                        ),*/

                      ],
                    ),

                    SizedBox(height: 13,),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Workout Title",style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black
                      ),),
                    ),

                    SizedBox(height: 7,),

                    TextFormField(
                      controller: workOutController,
                      autovalidateMode: AutovalidateMode.always,
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: Color(0XFF262626)),
                      decoration: InputDecoration(fillColor: Color(0XFFF2F2F2), filled: true,
                        border: InputBorder.none,
                        hintText: "",
                      ),
                      // decoration: const InputDecoration(
                      //   hintText: 'Bio',
                      //   labelText: 'Bio',
                      //
                      // ),
                      onSaved: (String value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                    ),

                    SizedBox(height: 20,),
                    if(_isLoad)
                      CircularProgressIndicator()
                    else
                      GestureDetector(
                        onTap: _trySubmit,
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.488,
                          height: 40,
                          child: Center(
                            child: Text("Create Workout",style: TextStyle(
                                fontSize: 21*MediaQuery.of(context).textScaleFactor,
                                color: Colors.white,
                                fontWeight: FontWeight.w600
                            ),),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Color(0XFF299FAB),
                          ),
                        ),
                      )
                  ],
                ),
              ),

              FutureBuilder(
                future: Provider.of<ApiManager>(context).fetchCleintWorkoutApi(),
                builder: (context,snapshots){
                  if(snapshots.connectionState == ConnectionState.waiting)
                    return Center(
                      child: CircularProgressIndicator(),);
                  else if (snapshots.hasError) {
                    return Text("${snapshots.error}");}
                  else{
                    if(snapshots.hasData){
                      ResponseFetchClientWorkout response = snapshots.data;
                      List<Data> data = response.data;
                      return Container(
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.only(top:8,bottom: 0,right: 20,left: 20),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                              ),

                            ],
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: data.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context,index){
                            return ListTile(
                              onTap: ()async{
                                await SharedPrefManager.savePrefString(AppConstant.CREATEWORKOUTID, data[index].id);
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddExerCise()));
                                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewWorkOutTemplate()));
                                },
                              title: Text(data[index].title,style: TextStyle(
                                fontSize: 15,
                                color: Colors.black87,
                                fontWeight: FontWeight.normal,),),
                              trailing: Icon(Icons.arrow_forward_ios_rounded),
                              subtitle: Text("Click to add exercises",
                                style: TextStyle(
                                    color:Color(0XFF2CB3BF),
                                    fontSize: 14*MediaQuery.of(context).textScaleFactor,
                                    fontWeight: FontWeight.w600
                                ),),
                            );
                          }, separatorBuilder: (context,index){
                          return Divider();
                        },),
                      );
                    }else{
                      return Center(child: Text("",
                        style: TextStyle(
                            fontFamily: "Proxima Nova",
                            fontWeight: FontWeight.w600,
                            fontSize: 20*MediaQuery.of(context).textScaleFactor
                        ),),);
                    }
                  }
                },
              ),

            ],),),
      ),
    );
  }
}