import 'package:flutter/material.dart';
import 'package:iterview_exam/modal/country_class.dart';

import '../../api_helper.dart';


class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {

  TextStyle myStyle = TextStyle(
      color: Colors.blue,
      fontSize: 17,
      fontWeight: FontWeight.bold,
      letterSpacing: 1,decoration: TextDecoration.underline);

  TextStyle myStyle1 = TextStyle(
      color: Colors.black,
      fontSize: 17,
      fontWeight: FontWeight.bold,
      letterSpacing: 1);

  late Future<List<Country>?> getData1;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData1 = APIHelper.apiHelper.fetchCountry();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          "View by country",
          style: TextStyle(
              color: Colors.white, fontSize: 19, fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0,left: 15,right: 15),
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: Container(
                        height: 65,
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          child: TextFormField(
                            controller: searchController,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                hintText: "Search any country...",
                                border: OutlineInputBorder(borderSide: BorderSide.none)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 7,),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          String searchedCountry = searchController.text;
                          setState(() {
                            getData1 = APIHelper.apiHelper.fetchCountry(pacl: searchedCountry);
                          });
                        },
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          child: Container(
                            height: 57,
                            width: 57,
                            child: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  FutureBuilder(
                    future: getData1,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("Error: ${snapshot.error}"),
                        );
                      } else if (snapshot.hasData) {
                        List<Country>? data1 = snapshot.data;

                        return (data1 != null)
                        ? Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 10,),
                                    Container(
                                      height: 50,
                                      width: 160,
                                      alignment: Alignment.center,
                                      color: Colors.white,
                                      child: Text("Country",style: myStyle,),
                                    ),
                                    SizedBox(width: 15,),
                                    Container(
                                      height: 50,
                                      width: 160,
                                      alignment: Alignment.center,
                                      color: Colors.white,
                                      child: Text("${data1[0].name}",style: myStyle1,),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Row(
                                  children: [
                                    SizedBox(width: 10,),
                                    Container(
                                      height: 50,
                                      width: 160,
                                      alignment: Alignment.center,
                                      color: Colors.white,
                                      child: Text("Flag",style: myStyle,),
                                    ),
                                    SizedBox(width: 15,),
                                    Container(
                                      height: 50,
                                      width: 160,
                                      alignment: Alignment.center,
                                      color: Colors.white,
                                      child: Image.network(data1[0].flag,fit: BoxFit.fill),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Row(
                                  children: [
                                    SizedBox(width: 10,),
                                    Container(
                                      height: 50,
                                      width: 160,
                                      alignment: Alignment.center,
                                      color: Colors.white,
                                      child: Text("Capital",style: myStyle,),
                                    ),
                                    SizedBox(width: 15,),
                                    Container(
                                      height: 50,
                                      width: 160,
                                      alignment: Alignment.center,
                                      color: Colors.white,
                                      child: Text("${data1[0].capital}",style: myStyle1,),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20,),

                              ],
                            ),
                          ),
                        )
                        : Center(
                          child: Text("No data found..."),
                        );


                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
