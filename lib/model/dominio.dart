class Dominio {
  int statusCode;
  String fqdn;
  List<String>? hosts;
  String? expiresAt;
  List<String>? suggestions;

  Dominio({
    required this.statusCode, 
    required this.fqdn, 
    this.hosts, 
    this.expiresAt, 
    this.suggestions
  });

  factory Dominio.fromJson(Map<String, dynamic> json){
    return Dominio(
      statusCode: json["status_code"] as int,
      fqdn: json["fqdn"] as String,
      hosts: (json["hosts"] != null) ? List<String>.from(json["hosts"] as List<dynamic>) : null,
      expiresAt: json["expires-at"] != null ? json["expires-at"] as String : null, 
      suggestions: (json["suggestions"] != null) ? List<String>.from(json["suggestions"] as List<dynamic>) : null,
    );
  }

  int getStatusCode() {
    return statusCode;
  }

  String getFqdn() {
    return fqdn;
  }

  List<String>? getHosts(){
    return hosts;
  }

  String? getExpiresAt(){
    return expiresAt;
  }

  List<String>? getSuggestions(){
    return suggestions;
  }
}