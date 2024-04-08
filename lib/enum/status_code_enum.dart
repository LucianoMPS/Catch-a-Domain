enum StatusCodeEnum {
  zero('Domínio disponível'),
  um('Disponível com tickets concorrentes'),
  dois('Já registrado'),
  tres('Indisponível'),
  quatro('Inválido'),
  cinco('Aguardando processo de liberação'),
  seis('Disponível no processo de liberação em andamento'),
  sete('Disponível no processo de liberação em andamento com tickets concorrentes'),
  oito('Erro'),
  nove('Domínio em processo de liberação competitivo'),
  dez('Desconhecido');

  final String description;
  const StatusCodeEnum(this.description);

  static String getStatus(int cod) {
    final result = switch (cod) {
      0 => StatusCodeEnum.zero.description,
      1 => StatusCodeEnum.um.description,
      2 => StatusCodeEnum.dois.description,
      3 => StatusCodeEnum.tres.description,
      4 => StatusCodeEnum.quatro.description,
      5 => StatusCodeEnum.cinco.description,
      6 => StatusCodeEnum.seis.description,
      7 => StatusCodeEnum.sete.description,
      8 => StatusCodeEnum.oito.description,
      9 => StatusCodeEnum.nove.description,
      10 => StatusCodeEnum.dez.description,
      _ => 'Códido Invalido'
    };
    return result;
  }
}
