import 'package:flutter/material.dart';
import 'package:yemek_siparis_uygulamasi/Yemek.dart';
import 'package:yemek_siparis_uygulamasi/siparis_sayfasi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  Future<List<Yemekler>>verileriGetir() async{
    var yemeklistesi=<Yemekler>[];//yemekler sınıfından liste oluşturmak için
    var y1=Yemekler(1, "Ayran", "ayran.png", 10);
    var y2=Yemekler(2, "Baklava", "baklava.png", 60);
    var y3=Yemekler(3, "Fanta", "fanta.png", 25);
    var y4=Yemekler(4, "Kadayıf", "kadayif.png", 45);
    var y5=Yemekler(5, "Köfte", "kofte.png", 100);
    var y6=Yemekler(6, "Makarna", "makarna.png", 50);


    yemeklistesi.add(y1);
    yemeklistesi.add(y2);
    yemeklistesi.add(y3);
    yemeklistesi.add(y4);
    yemeklistesi.add(y5);
    yemeklistesi.add(y6);

    return yemeklistesi;

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Menü"),
      ),
      body: FutureBuilder<List<Yemekler>>
        (future: verileriGetir(),
          builder: (context,snapshot){
          if(snapshot.hasData){
            var yemeklistesi=snapshot.data;
            return ListView.builder(
              itemCount: yemeklistesi?.length,
              itemBuilder: (context,index){//for döngüsü gibi çalışır liste uzunluğu kadar döner
                var yemek=yemeklistesi?[index];
                return GestureDetector(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SiparisSayfasi(yemekisim: yemek.yemekAdi, yemekresim: yemek.yemekResmi, yemekfiyat: yemek.yemekfiyat)));
                  },
                  child: Card(
                    child:Row(
                      children: [
                        SizedBox(
                          height: 150,
                            width: 150,
                            child: Image.asset("resimler/${yemek!.yemekResmi}")),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("${yemek.yemekAdi}",style: TextStyle(fontSize: 20),),
                                SizedBox(height: 50,),
                                Text("${yemek.yemekfiyat} ₺",style: TextStyle(fontSize: 20),),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_right),
                      ],
                    ) ,
                  ),
                );
              },//itembuilder
            );
          }
          else{
            return Center(child: CircularProgressIndicator());
          }
          }),
    );
  }
}
