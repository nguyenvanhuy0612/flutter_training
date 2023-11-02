import 'package:flutter/material.dart';

class ShopeeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [buildRow('Username'), buildRow('Password'), LoginBtn(context)],
    );
  }

  Column LoginBtn(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ShopeeApp()));
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(350, 40),
              backgroundColor: Colors.blue[800],
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(8.0), // Điều này đặt độ bo của góc
              ),
            ),
            child: const Text('Đăng nhập')),
        const SizedBox(height: 10.0),
        GestureDetector(
          onTap: () {
            print('Click Button đăng kí');
          },
          child: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Bạn chưa có tài khoản? ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                TextSpan(
                  text: 'Đăng ký ngay',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Row buildRow(String text) {
    return Row(
      children: [
        Expanded(flex: 0, child: Text(text)),
        Expanded(
          flex: 4,
          child: Container(
            padding: const EdgeInsets.only(
                left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: text,
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}