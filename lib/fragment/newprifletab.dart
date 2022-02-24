import 'package:flutter/material.dart';

class NewProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top:20,bottom: 20,right: 20,left: 20),
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
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(22), topLeft: Radius.circular(22)),

          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Basic Profile",style: TextStyle(
                      fontSize: 18*MediaQuery.of(context).textScaleFactor,
                      color: Color(0XFF2CB3BF),
                      fontWeight: FontWeight.w600
                  ),),
                ),

                SizedBox(height: 10,),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Name",style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                  ),),
                ),

                SizedBox(height: 8,),

                TextFormField(
                  autovalidateMode: AutovalidateMode.always,
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

                SizedBox(height: 10,),

                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Gender",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black
                        ),),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Age",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black
                        ),),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 8,),

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.always,
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
                    ),

                    SizedBox(width: 20,),

                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        autovalidateMode: AutovalidateMode.always,
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
                    ),
                  ],
                ),

                SizedBox(height: 10,),

                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Weight",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black
                        ),),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Height",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black
                        ),),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 8,),

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.always,
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
                    ),

                    SizedBox(width: 20,),

                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        autovalidateMode: AutovalidateMode.always,
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
                    ),
                  ],
                ),

                SizedBox(height: 10,),

                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Goal",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black
                        ),),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Occupations",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black
                        ),),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 8,),

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.always,
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
                    ),

                    SizedBox(width: 20,),

                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        autovalidateMode: AutovalidateMode.always,
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
                    ),
                  ],
                ),

                SizedBox(height: 10,),

                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Contact Details",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black
                        ),),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Relationship Status",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black
                        ),),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 8,),

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.always,
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
                    ),

                    SizedBox(width: 20,),

                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        autovalidateMode: AutovalidateMode.always,
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
                    ),
                  ],
                ),

                SizedBox(height: 25,),

                GestureDetector(
                  onTap: (){},
                  child: Container(
                    margin: EdgeInsets.only(top: 10,bottom: 10,left: 15,right: 15),
                    width: MediaQuery.of(context).size.width,
                    height: 45,
                    child: Center(
                      child: Text("SUBMIT",style: TextStyle(
                          fontSize: 21*MediaQuery.of(context).textScaleFactor,
                          color: Colors.white,
                          fontWeight: FontWeight.normal
                      ),),),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0XFF299FAB),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}