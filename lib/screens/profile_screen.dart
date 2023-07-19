import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:google_fonts/google_fonts.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
       padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 10),
       children: [
        Card(
             shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 8,
          child: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text('haneen er@gmail.com'),
              SizedBox(height: 20,),
              Text('id: 71234568'),
            ],),
          ),
        ),
        SizedBox(height: 20,),
        Text('Transfer information',
        style: GoogleFonts.crimsonText(
              color: Color(0xFFa35c6e),
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        SizedBox(height: 20,),

        DataTable(
          columnSpacing: 20,
          
        columns: [
          DataColumn(
            label: Text('ID'),
          ),
          DataColumn(
            label: Text('Balance'),
          ),
          DataColumn(
            label: Text('Category'),
          ),
          DataColumn(
            label: Text('Date'),
          ),
           DataColumn(
            label: Text('Time'),
          ),
       
        ], 
  rows: [
            
         DataRow(cells: [
            DataCell(Text('1')),
            DataCell(Text('50.0\$')),
            DataCell(Text('paltle')),
            DataCell(Text('16-6-2023 - 6:00 pm')),
            DataCell(Text(' 6:00 pm')),
        
         ])
    ])
  
       ],
    );
  }
}