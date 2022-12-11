import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = "USD";
Map<String,String>bitValue= {};
bool isWaiting=false;


  void getData()async{
    isWaiting =true;
try{
  CoinData coinData=CoinData();
    var bitData=await coinData.getCurrencyData(cur: selectedCurrency);
    isWaiting=false;
setState(() {
  bitValue=bitData;
  print(bitValue);
});


}catch(e){
  print(e);
}
  }

  DropdownButton<String> androidDropDown() {
    List<DropdownMenuItem<String>> dropDownItems = [];

    for (String item in currenciesList) {
      var newItem = DropdownMenuItem(child: Text(item), value: item);
      dropDownItems.add(newItem);
    }
    return DropdownButton(
      value: selectedCurrency,
      items: dropDownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency=value.toString();
          getData();

        });
      },
    );
  }




  CupertinoPicker iosPicker() {
    List<Text> cupertinoPickerItems = [];

    for (String item in currenciesList) {
     
      cupertinoPickerItems.add(Text(item));
    }



 return   CupertinoPicker(
      onSelectedItemChanged: (int value) {
        selectedCurrency=value.toString();
        print(value);
      },
      itemExtent: 32,
      children: cupertinoPickerItems,
    );
  }
@override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [

              Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 18),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: cryptoCard(value: isWaiting ? '?' : bitValue['BTC'].toString(), selectedCurrency: selectedCurrency, cryptoCurrency: 'BTC'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 18),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: cryptoCard(value: isWaiting ? '?' : bitValue['ETH'].toString(), selectedCurrency: selectedCurrency, cryptoCurrency: 'ETH'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 18),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: cryptoCard(value: isWaiting ? '?' : bitValue['LTC'].toString(), selectedCurrency: selectedCurrency, cryptoCurrency: 'LTC'),
                ),
              ),



            ],
          ),

          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child:Platform.isIOS? iosPicker():androidDropDown()),
        ],
      ),
    );
  }
}

Widget cryptoCard({
  required final String value,
 required final String selectedCurrency,
 required final String cryptoCurrency,
})=>Padding(
  padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
  child: Text(
    '1 $cryptoCurrency = $value $selectedCurrency',
    textAlign: TextAlign.center,
    style: const TextStyle(
      fontSize: 20.0,
      color: Colors.white,
    ),
  ),
);

