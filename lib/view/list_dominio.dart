import 'package:dominio_project/api/api_dominio.dart';
import 'package:dominio_project/enum/status_code_enum.dart';
import 'package:dominio_project/model/dominio.dart';
import 'package:flutter/material.dart';

class ListDominio extends StatefulWidget {
  const ListDominio({Key? key}) : super(key: key);

  @override
  _ListDominioState createState() => _ListDominioState();
}

class _ListDominioState extends State<ListDominio> {
  @override
  Widget build(BuildContext context) {
    final String domain = ModalRoute.of(context)!.settings.arguments as String; // recupera o valor digitado pelo usuario na tela index e atribui a variavel domain, a qual representa o dominio a ser pesquisado

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:  Text(domain, style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(
          color: Colors.white, // Defina a cor desejada para a seta de voltar
        ),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FutureBuilder<Dominio>(
            future: ApiDominio.getDominio(domain),
            builder: ((context, snapshot) {
              if (!snapshot.hasData) {
                return const Expanded(
                  flex: 9,
                  child: Center(child: CircularProgressIndicator()),
                );
              } else {
                Dominio data = snapshot.data!; // Declara um objeto que armazena os dados de dominio
                return Expanded(
                  flex: 2,
                  child: ListView(
                    children: [
                      Container(  //imprime o status do dominio digitado
                        padding: const EdgeInsets.fromLTRB(5, 5, 0, 10),
                        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[850],
                          border: Border.all(color: const Color.fromARGB(255, 48, 48, 48)),
                        ),
                        child: Text(
                          "Status: ${StatusCodeEnum.getStatus(data.getStatusCode())}",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      Container(  //imprime o dominio digitado pelo usuario
                        padding: const EdgeInsets.fromLTRB(5, 5, 0, 10),
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[850],
                          border: Border.all(color: const Color.fromARGB(255, 48, 48, 48)),
                        ),
                        child: Text(
                          "Domínio: ${data.getFqdn()}",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      Visibility(
                        visible: data.getHosts()?.isNotEmpty ?? false,
                        child: Container(  //titulo do listview dos hosts
                          padding: const EdgeInsets.fromLTRB(5, 5, 0, 10),
                          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          decoration: BoxDecoration(
                            color: Colors.grey[850],
                            border: Border.all(color: const Color.fromARGB(255, 48, 48, 48)),
                          ),
                          child: const Text(
                            "Hosts",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ), 
                      Visibility(
                        visible: data.getHosts()?.isNotEmpty ?? false,
                        child: Container( // ListView dos Hosts
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
                          margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[850],
                            border: Border.all(color: const Color.fromARGB(255, 48, 48, 48)),
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: data.getHosts()?.length ?? 0,
                            itemBuilder: (context, index) {
                              return ListTile(
                                contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                                title: Text(
                                  data.getHosts()![index],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            }
                          ),
                        ),
                      ),
                      Visibility(
                        visible: data.getExpiresAt()?.isNotEmpty ?? false,
                        child: Container(  //Data em que o dominio expira
                          padding: const EdgeInsets.fromLTRB(5, 5, 0, 10),
                          margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                          decoration: BoxDecoration(
                            color: Colors.grey[850],
                            border: Border.all(color: const Color.fromARGB(255, 48, 48, 48)),
                          ),
                          child: Text(
                            "Data de expiração: ${data.getExpiresAt()?.substring(0, 10)}", //vish fiz uma cambiarra aqui
                              style: const TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: data.getSuggestions()?.isNotEmpty ?? false,
                        child: Container( //Titulo do imprime as sugestões
                          padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
                          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          decoration: BoxDecoration(
                            color: Colors.grey[850],
                            border: Border.all(color: const Color.fromARGB(255, 48, 48, 48)),
                          ),
                          child: const Text(
                            "Sugestões",
                            style: TextStyle(
                              fontSize: 18, 
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: data.getSuggestions()?.isNotEmpty ?? false,
                        child: Container(  //imprime as sugestões
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
                          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.grey[850],
                            border: Border.all(color: const Color.fromARGB(255, 48, 48, 48)),
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: data.getSuggestions()?.length ?? 0,
                            itemBuilder: (context, index) {
                              return ListTile(
                                minLeadingWidth: 10,
                                contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                                leading: Text(
                                  data.getSuggestions()![index],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),                
                    ],
                  ),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
