import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 // Variabel untuk pageview
PageController? _pageController;
int currentSlide=1;
final gambarPage=['images/wisata-jatim.jpg', 'images/wisata-aceh.jpg', 'images/wisata-lombok.jpg','images/wisata-jakarta.jpg','images/wisata-riau.jpg'];

@override
  void initState() {
    _pageController = PageController(
      initialPage: currentSlide,
      keepPage: false,
      viewportFraction: 0.5,
    );
    super.initState();
  }

  // Data gambar
  // ignore: non_constant_identifier_names
  final _WisataFavorit = {
{
  'nama': 'Mesjid Baiturrahman',
  'gambar': 'images/wisata-aceh.jpg',
  'kat': 'Wisata Religius',
  'lokasi': 'Kota Banda Aceh'
},
{
  'nama': 'Mall Jakarta',
  'gambar': 'images/wisata-jakarta.jpg',
  'kat': 'Wisata Belanja',
  'lokasi': 'Kota Jakarta'
},
{
  'nama': 'Pegunungan Bromo',
  'gambar': 'images/wisata-jatim.jpg',
  'kat': 'Wisata Alam',
  'lokasi': 'Jawa Timur'
},
{
  'nama': 'Pantai Kuta Lombok',
  'gambar': 'images/wisata-lombok.jpg',
  'kat': 'Wisata Alam',
  'lokasi': 'Pulau Lombok'
},
{
  'nama': 'Pantai Nongsa',
  'gambar': 'images/wisata-riau.jpg',
  'kat': 'Wisata Pantai',
  'lokasi': 'Pulau Batam'
},
}.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //Bagian code Untuk Identitas
                    Identitas(),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        'VISIT INDONESIA',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          ),
                          ),
                          ),
                          Text('Indonesia memiliki destinasi wisata halal yang tersebar di berbagai pulau',
                          style: TextStyle(
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                            ),
                            ),

                    //Bagian Code untuk Listview
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text('Wisata Favorit',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        ),

                        Container(
                          child: Expanded(
                            child: ListView.separated(
                              physics: PageScrollPhysics(),
                              separatorBuilder: (context, index) => Divider(
                                indent: 3,
                                ),
                                scrollDirection: Axis.horizontal,
                                itemCount: _WisataFavorit.length,
                                itemBuilder: (context, index) => ListFavorit(index),
                                ),
                                ),
                                ),
                  ],
                ),
              ),
            ),

            Flexible(
              flex: 1,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Divider(),
                    //Bagian Code Untuk Page View
                    
Expanded(
  child: PageView.builder(
    controller: _pageController,
    onPageChanged: (value) {
      setState(() {
        currentSlide = value;
      });
    },
    itemBuilder: (BuildContext context, int index) =>
        Tampilslide(index),
    itemCount: 5,
  ),
),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
// Fungsi slide show pageView
// ignore: non_constant_identifier_names
Tampilslide(int index) {
  return Container(
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
          gambarPage[index],
        ),
        fit: BoxFit.cover, 
      ),
      borderRadius: BorderRadius.circular(20),
    ),
  );
}

// Fungsi Identitas
Identitas(){
  return Row(
      children: <Widget>[
        Container(
          width: 50,
          height: 50,
          margin: EdgeInsets.only(right: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network(
              'https://cdn.sindonews.net/dyn/620/content/2017/12/18/156/1266821/perlu-ada-standarisasi-aturan-mengenai-wisata-halal-lGR-thumb.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Wisata Halal',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text('halaltourism')
          ],
        ),
        Spacer(
          flex: 2,
        ),
        Icon(
          Icons.menu,
          size: 50,
        )
      ],
    );
}

// FUngsi wisata Favorit
ListFavorit(index) {
    return SizedBox(
      height: 80,
      width: 250,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
        decoration: BoxDecoration(
            border: Border.all(width: 0.3, color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(_WisataFavorit[index]['gambar'] ??'',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(_WisataFavorit[index]['nama'] ??'',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(_WisataFavorit[index]['kat'] ??'',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(_WisataFavorit[index]['lokasi'] ??'',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  } 

}

