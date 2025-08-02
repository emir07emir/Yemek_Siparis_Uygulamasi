import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SiparisSayfasi extends StatefulWidget {
  String yemekisim;
  String yemekresim;
  int yemekfiyat;


  SiparisSayfasi({required this.yemekisim, required this.yemekresim,required this.yemekfiyat});

  @override
  State<SiparisSayfasi> createState() => _SiparisSayfasiState();
}

class _SiparisSayfasiState extends State<SiparisSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.yemekisim),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/${widget.yemekresim}"),
            Text("${widget.yemekfiyat} ₺",style:GoogleFonts.montserrat(fontSize: 30)),
            SizedBox(
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  elevation: 15,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius:BorderRadiusGeometry.circular(15)
                  ),
                ), //stylefrom
                child: Text("Sipariş Ver",style: GoogleFonts.montserrat(fontSize: 25,fontWeight: FontWeight.bold),),
                onPressed: (){
                  print("${widget.yemekisim} Siparişi verildi");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
