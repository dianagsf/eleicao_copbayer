class ResultadoModel {
  int cANDIDATO;
  int qTDVOTOS;
  String nOME;
  String aSSOCIADO;
  String nASCIMENTO;

  ResultadoModel(
      {this.cANDIDATO,
      this.qTDVOTOS,
      this.nOME,
      this.aSSOCIADO,
      this.nASCIMENTO});

  ResultadoModel.fromJson(Map<String, dynamic> json) {
    cANDIDATO = json['CANDIDATO'];
    qTDVOTOS = json['QTD_VOTOS'];
    nOME = json['NOME'];
    aSSOCIADO = json['ASSOCIADO'];
    nASCIMENTO = json['NASCIMENTO'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CANDIDATO'] = this.cANDIDATO;
    data['QTD_VOTOS'] = this.qTDVOTOS;
    data['NOME'] = this.nOME;
    data['ASSOCIADO'] = this.aSSOCIADO;
    data['NASCIMENTO'] = this.nASCIMENTO;
    return data;
  }
}
