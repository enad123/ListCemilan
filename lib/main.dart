import 'package:flutter/material.dart';
import 'package:makanan_app/DetailPage.dart';


//buat hacktober fest
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('List Makanan'),
      ),
      body: _PageList(),
    );
  }
}

final baseTextStyle = const TextStyle(color: Colors.white, fontFamily: 'arial');
final bigHeaderTextStyle =
    baseTextStyle.copyWith(fontSize: 24.0, fontWeight: FontWeight.bold);
final descTextStyle =
    baseTextStyle.copyWith(fontSize: 18.0, fontWeight: FontWeight.w400);
final footerTextStyle =
    baseTextStyle.copyWith(fontSize: 14.0, fontWeight: FontWeight.w400);

class _PageList extends StatefulWidget {
  @override
  __PageStateListState createState() => __PageStateListState();
}

class __PageStateListState extends State<_PageList> {
  List<String> judul = ['Pizza', 'Sandwich', 'Sate sosis'];
  List<String> subJudul = [
    'Makanan Khas italia',
    'Makanan Khas situ lah',
    'Makanan Khas Situ juga'
  ];
  List<String> gambar = [
    'assets/images/pizza.png',
    'assets/images/sandwich.png',
    'assets/images/sosis.png'
  ];
  List<String> jmlh = ['Ready', 'Ready', 'Limited'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: judul.length,
          itemBuilder: (BuildContext contex, int index) {
            final title = judul[index].toString();
            final subTitle = subJudul[index].toString();
            final jumlah = jmlh[index].toString();
            final img = gambar[index].toString();
            return Container(
              height: 200.0,
              padding: EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Stack(
                  children: <Widget>[
                    backgroundImage(img),
                    Container(
                      child: topContent(title, subTitle, jumlah),
                    )
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(
                                itemJudul: title,
                                itemSub: subTitle,
                                qty: jumlah,
                                itemImage: img,
                              )));
                },
              ),
            );
          }),
    );
  }

  backgroundImage(String gambar) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.luminosity),
              image: AssetImage(gambar))),
    );
  }

  topContent(String nama, String deskripsi, String stok) {
    return new Container(
//      height: 80.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            nama,
            style: bigHeaderTextStyle,
          ),
          Text(
            deskripsi,
            style: descTextStyle,
          ),
          Container(
            height: 2.0,
            width: 80.0,
            color: Colors.redAccent,
          ),
          Text(
            stok,
            style: footerTextStyle,
          ),
        ],
      ),
    );
  }
}
