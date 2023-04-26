import 'dart:io';

import 'package:checkout_screen_ui/checkout_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Payments_Method extends StatefulWidget {
  const Payments_Method({super.key});

  @override
  State<Payments_Method> createState() => _Payments_MethodState();
}

class _Payments_MethodState extends State<Payments_Method> {


    Future<void> _nativePayClicked(BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Native Pay requires setup')));
  }
   Future<void> _cashPayClicked(BuildContext context) async {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Cash Pay requires setup')));
  }

  @override
  Widget build(BuildContext context) {
     final demoOnlyStuff = DemoOnlyStuff();

    /// RECOMENDED: A global Key to access the credit card pay button options
    ///
    /// If you want to interact with the payment button icon, you will need to
    /// create a global key to pass to the checkout page. Without this key
    /// the the button will always display 'Pay'. You may view several ways to
    /// interact with the button elsewhere within this example.
    final GlobalKey<CardPayButtonState> _payBtnKey =
        GlobalKey<CardPayButtonState>();

    /// REQUIRED: A function to handle submission of credit card form
    ///
    /// A function is needed to handle your caredit card api calls.
    ///
    /// NOTE: This function in our demo example is under the widget's 'build'
    /// method only becuase it needs access to an instance variable. There is
    /// no requirement to have this function built here in live code.
    Future<void> _creditPayClicked(CardFormResults results) async {
      // you can update the pay button to show somthing is happening
      _payBtnKey.currentState?.updateStatus(CardPayButtonStatus.processing);

      // This is where you would implement you Third party credit card
      // processing api
      demoOnlyStuff.callTransactionApi(_payBtnKey);

      // ignore: avoid_print
      print(results);
      // WARNING: you should NOT print the above out using live code
    }

    /// REQUIRED: A list of what the user is buying
    ///
    /// A list of item will be needed to pass into the checkout page. This is a
    /// simple demo array of [PriceItem]s used to make the demo work. The total
    /// price is automatically added later.
    ///
    /// **NOTE:**
    /// It is recomended to have no more that 10 items when using the
    /// current version due to limits of scrollability
    final List<PriceItem> _priceItems = [
      PriceItem(name: 'Product A', quantity: 1, totalPriceCents: 5200),
      PriceItem(name: 'Product B', quantity: 2, totalPriceCents: 8599),
      PriceItem(name: 'Product C', quantity: 1, totalPriceCents: 2499),
      PriceItem(name: 'Delivery Charge', quantity: 1, totalPriceCents: 1599),
    ];

    /// REQUIRED: A name representing the reciever of the funds from user
    ///
    /// Demo vendor name provided here. User's need to know who is recieving
    /// their money
    const String _payToName = 'Digital NFL Fan';

    /// REQUIRED: (if you are using the native pay options)
    ///
    /// Determine whether this platform is iOS. This affects which native pay
    /// option appears. This is the most basic form of logic needed. You adjust
    /// this logic based on your app's needs and the platforms you are
    /// developing for.
    final _isApple = Platform.isIOS;

    /// RECOMENDED: widget to display at footer of page
    ///
    /// Apple and Google stores typically require a link to privacy and terms when
    /// your app is collecting and/or transmitting sensitive data. This link is
    /// expected on the same page as the form that the user is filling out. You
    /// can make this any type of widget you want, but we have created a prebuilt
    /// [CheckoutPageFooter] widget that just needs the corresponding links
    const _footer = CheckoutPageFooter(
      // These are example url links only. Use your own links in live code
      privacyLink: 'https://stripe.com/privacy',
      termsLink: 'https://stripe.com/payment-terms/legal',
      note: 'Powered By Not_Stripe',
      noteLink: 'https://stripe.com/',
    );

    /// OPTIONAL: A function for the back button
    ///
    /// This to be used as needed. If you have another back button built into your
    /// app, you can leave this function null. If you need a back button function,
    /// simply add the needed logic here. The minimum required in a simple
    /// Navigator.of(context).pop() request
    Function? _onBack = Navigator.of(context).canPop()
        ? () => Navigator.of(context).pop()
        : null;

    // Put it all together
    return Scaffold(
      appBar: null,
      body: CheckoutPage(
        priceItems: _priceItems,
        payToName: _payToName,
        displayNativePay: true,
        onNativePay: () => _nativePayClicked(context),
        displayCashPay: true,
        onCashPay: () => _cashPayClicked(context),
        isApple: _isApple,
        onCardPay: (results) => _creditPayClicked(results),
        onBack: _onBack,
        payBtnKey: _payBtnKey,
        displayTestData: true,
        footer: _footer,
      ),
    );
  }}
  class DemoOnlyStuff {
  // DEMO ONLY:
  // this variable is only used for this demo.
  bool shouldSucceed = true;

  // DEMO ONLY:
  // In this demo, this function is used to delay the reseting of the pay
  // button state in order to allow the user to resubmit the form.
  // If you API calls a failing a transaction, you may need a similar function
  // to update the button from CardPayButtonStatus.fail to
  // CardPayButtonStatus.success. The user will not be able to submit another
  // payment until the button is reset.
  Future<void> provideSomeTimeBeforeReset(
      GlobalKey<CardPayButtonState> _payBtnKey) async {
    await Future.delayed(const Duration(seconds: 2), () {
      _payBtnKey.currentState?.updateStatus(CardPayButtonStatus.ready);
      return;
    });
  }

  Future<void> callTransactionApi(
      GlobalKey<CardPayButtonState> _payBtnKey) async {
    await Future.delayed(const Duration(seconds: 2), () {
      if (shouldSucceed) {
        _payBtnKey.currentState?.updateStatus(CardPayButtonStatus.success);
        shouldSucceed = false;
      } else {
        _payBtnKey.currentState?.updateStatus(CardPayButtonStatus.fail);
        shouldSucceed = true;
      }
      provideSomeTimeBeforeReset(_payBtnKey);
      return;
    });
      }
  }



