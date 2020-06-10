import 'package:flutter/material.dart';
import 'package:mybitcointickerflutter/size_config.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';

  List<DropdownMenuItem> getDropdownItems() {
    List<DropdownMenuItem> dropDownItems = [];
    for (int i = 0; i < currenciesList.length; i++) {
      var newItem = DropdownMenuItem(
          child: Text(currenciesList[i]), value: currenciesList[i]);
      dropDownItems.add(newItem);
    }
    return dropDownItems;
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
              height: 150.0,
              alignment: Alignment.center,
              padding:
                  EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 7.5),
              color: Colors.lightBlue,
              child: DropdownButton<String>(
                  value: selectedCurrency,
                items: getDropdownItems(),
                onChanged: (value) {
                  setState(() {
                    selectedCurrency = value;
                  });
                },
              ),
            ),
          ],
        ));
  }
}
