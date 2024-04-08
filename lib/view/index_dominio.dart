import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IndexDominio extends StatefulWidget {
  const IndexDominio({Key? key}) : super(key: key);

  @override
  _IndexDominioState createState() => _IndexDominioState();
}

class _IndexDominioState extends State<IndexDominio> {
  final TextEditingController domain = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "CATCH A DOMAIN",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
          height: 150,
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextField(
                style: TextStyle(color: Colors.white),
                controller: domain,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.white),
                  ),
                  label: Text(
                    "Dominio a ser pesquisado",
                    style: TextStyle(color: Colors.white),
                  ),
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: "Ex: brasilapi.com.br",
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const LinearBorder(),
                  backgroundColor: Colors.grey[800],
                ),
                onPressed: () => {
                  Navigator.pushNamed(context, '/list', arguments: domain.text)
                },
                child: const Text(
                  "Pesquisar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
