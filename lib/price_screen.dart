import 'package:flutter/material.dart';
import 'package:mybitcointickerflutter/size_config.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';

  DropdownButton<String> androidDropDown() {
    List<DropdownMenuItem> dropdownItems = [];
    for (int i = 0; i < currenciesList.length; i++) {
      var newItem = DropdownMenuItem(
          child: Text(currenciesList[i]), value: currenciesList[i]);
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }
    return CupertinoPicker(
        backgroundColor: Colors.lightBlue,
        itemExtent: SizeConfig.safeBlockHorizontal * 8,
        onSelectedItemChanged: (selectedIndex) {},
        children: pickerItems);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(
                  SizeConfig.blockSizeHorizontal * 4.5,
                  SizeConfig.safeBlockVertical * 4.5,
                  SizeConfig.blockSizeHorizontal * 4.5,
                  0),
              child: Card(
                color: Colors.lightBlueAccent,
                elevation: SizeConfig.safeBlockVertical * 1.25,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      SizeConfig.safeBlockHorizontal * 2.5),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.safeBlockVertical * 3.75,
                  horizontal: SizeConfig.blockSizeHorizontal * 3.75),
              child: Text(
                '1 BTC = ? USD',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 5,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
                height: SizeConfig.safeBlockVertical * 38,
                alignment: Alignment.center,
                padding:
                EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 7.5),
                color: Colors.lightBlue,
                child: null),
          ],

      )
      ,
    );
  }
}
