import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/category.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _counter=0;
  String? _selectedId;
  List<Category> _categories= <Category>[
    Category(id: 1, name:'Al_Azhar University'),
    Category(id: 2, name:'Paltel'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 10),
      children: [
        Card(
          margin: EdgeInsets.only(top: 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10,
          shadowColor: Color(0xFFa35c6e),
          child: Container(
            decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(0.8, 1),
                    colors:
                    <Color>[
                      Color(0xffe9abb1),
                      Color(0xffa35c6e),
                      Color(0xff1a364e),
                    ]
                )
            ) ,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 15, 20,10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Text('Your Balance',
                    style: GoogleFonts.crimsonText(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text('\$500',
                    style: GoogleFonts.crimsonText(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 50,),
        Text('Enter Balance Amounte',
          style: GoogleFonts.crimsonText(
              color: Color(0xff1a364e),
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
       SizedBox(height: 15,),
        Row(
          children: [
            Expanded(
              
          flex: 2,
          child: ElevatedButton(
            onPressed: (){
              setState(() {
                ++_counter;
              });
              style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff1a364e),
              minimumSize: Size(0, 45),
            );
            },
            child: Icon(Icons.add, ),
            ),
            ),
            Expanded(child:
            Text(
              "\$ ${_counter.toString()}",
              textAlign: TextAlign.center,
              style: GoogleFonts.cairo(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color:Color(0xff1a364e),
              ),
            )),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: (){
                  setState(() {
                    --_counter;
                  });
                  ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff1a364e)
                  );
                },
                child: Icon(Icons.minimize, ),
              ),
            ),

          ],
        ),
        SizedBox(height: 30,),
        Text(
          'Select Category ',
          style: GoogleFonts.crimsonText(
              color: Color(0xff1a364e),
              fontWeight: FontWeight.bold,
              fontSize: 20
          ),
        ),
        SizedBox(height: 5,),
        DropdownButton<String>(
          isExpanded: true,
          hint: Text(' Categories'),
          //  icon: Icon(Icons.fa),
          onChanged: (String? value){
            if(value!=null){
              setState(() {
                _selectedId =value;


                // if(_selectedId==1) {
                //   print(1);
                // }else{Text('4');}



              });
            }
          },
          value: _selectedId,
          items: _categories.map((Category category) => DropdownMenuItem<String>(
            child:Text(category.name),
            value: category.id.toString(),
          )
          ).toList(),
        ),
        SizedBox(height: 30,),
        ElevatedButton(
          onPressed: (){},
          child:Text(
            'SEND',
            style: GoogleFonts.crimsonText(
                color: Colors.white,
                fontWeight: FontWeight.w200,
                fontSize: 20
            ),
          ) ,
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF162a40),
              minimumSize: Size(50, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(10),
                    topStart: Radius.circular(10),
                  )
              )
          ),
        ),
      ],
    );
  }
}