import 'package:bitcoin_ticker/networking.dart';
const ApiKey='EA62FE88-2B51-4EAE-A86A-51EFE53EA9AE';
 const coinApiUrl='https://rest.coinapi.io/v1/exchangerate';
class CoinData{
  Future  getCurrencyData({required String cur}) async{
    Map<String,String> cryptoPrices={};
    for(String crypto in cryptoList){
      NetwrokHelper netwrokHelper = NetwrokHelper(
          '$coinApiUrl/$crypto/$cur?apikey=$ApiKey');
      var currencyData=await netwrokHelper.getData();

      cryptoPrices[crypto]=currencyData['rate'].toStringAsFixed(0);
      print(crypto);

    }

    return cryptoPrices;
  }


}

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

