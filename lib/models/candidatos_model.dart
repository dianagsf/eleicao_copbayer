class CandidatosModel {
  int mATRICULA;
  String nOME;
  String nASCIMENTO;
  String aSSOCIADO;
  String aREA;

  CandidatosModel(
      {this.mATRICULA, this.nOME, this.nASCIMENTO, this.aSSOCIADO, this.aREA});

  CandidatosModel.fromJson(Map<String, dynamic> json) {
    mATRICULA = json['MATRICULA'];
    nOME = json['NOME'];
    nASCIMENTO = json['NASCIMENTO'];
    aSSOCIADO = json['ASSOCIADO'];
    aREA = json['AREA'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MATRICULA'] = this.mATRICULA;
    data['NOME'] = this.nOME;
    data['NASCIMENTO'] = this.nASCIMENTO;
    data['ASSOCIADO'] = this.aSSOCIADO;
    data['AREA'] = this.aREA;
    return data;
  }
}
