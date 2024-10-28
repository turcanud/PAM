import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _amountController = TextEditingController();
  double convertedAmount = 0.0;
  final double exchangeRate = 17.65;

  @override
  void initState() {
    super.initState();
    _amountController.text = '1000.00';
    _convertCurrency();
  }

  void _convertCurrency() {
    final double? amount = double.tryParse(_amountController.text);
    if (amount != null) {
      setState(() {
        convertedAmount = amount / exchangeRate; // Perform the conversion
      });
    } else {
      setState(() {
        convertedAmount = 0.0; // Reset if the input is invalid
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(25.0),
        child: AppBar(
          backgroundColor: Colors.white,
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 35.0),
            child: Text(
              "Currency Converter",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w700,
                color: Color(0xff1F2261),
                fontFamily: 'Roboto',
              ),
            ),
          ),
          Container(
            height: 305.0,
            width: 347.0,
            margin: const EdgeInsets.symmetric(horizontal: 25.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1.0,
                  blurRadius: 6,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // First Row: MDL Input
                const Text(
                  "Amount",
                  style: TextStyle(
                    color: Color(0xffA1A1A1),
                    fontSize: 16.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    // Flag and Dropdown
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Image.asset('assets/images/mdl_flag.png', width: 24.0),
                          const SizedBox(width: 8.0),
                          DropdownButton<String>(
                            value: "MDL",
                            underline: const SizedBox(),
                            items: const [
                              DropdownMenuItem(
                                value: "MDL",
                                child: Text("MDL"),
                              ),
                              DropdownMenuItem(
                                value: "USD",
                                child: Text("USD"),
                              ),
                            ],
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: TextField(
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 12.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFEFEFEF),
                        ),
                        onChanged: (value) {
                          _convertCurrency();
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),

                // Conversion Button
                Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF26278D),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.swap_vert, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ),

                const SizedBox(height: 16.0),

                // Second Row: USD Output
                const Text(
                  "Converted Amount",
                  style: TextStyle(
                    color: Color(0xffA1A1A1),
                    fontSize: 16.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    // Flag and Dropdown
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Image.asset('assets/images/usd_flag.png', width: 24.0),
                          const SizedBox(width: 8.0),
                          DropdownButton<String>(
                            value: "USD",
                            underline: const SizedBox(),
                            dropdownColor: Colors.white,
                            items: const [
                              DropdownMenuItem(
                                value: "USD",
                                child: Text("USD"),
                              ),
                              DropdownMenuItem(
                                value: "MDL",
                                child: Text("MDL"),
                              ),
                            ],
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 12.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          hintText: convertedAmount > 0
                              ? convertedAmount.toStringAsFixed(2)
                              : '0.00', // Handle empty state
                          filled: true,
                          fillColor: const Color(0xFFEFEFEF),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Indicative Exchange Rate",
                style: TextStyle(
                  color: Color(0xffA1A1A1),
                  fontSize: 16.0,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: [
                const Text(
                  "1 USD = ",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 100.0,
                  child: TextFormField(
                    readOnly: true,
                    initialValue: '17.65',
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Text(
                  " MDL",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
