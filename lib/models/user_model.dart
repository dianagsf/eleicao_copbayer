class UserModel {
  int mATRICULA;
  String nOME;
  String aSSOCIADO;
  String aDMISSAO;
  String cODEMP;
  String cPF;
  String nASCIMENTO;
  String aREA;
  String vOTOUEM;

  UserModel(
      {this.mATRICULA,
      this.nOME,
      this.aSSOCIADO,
      this.aDMISSAO,
      this.cODEMP,
      this.cPF,
      this.nASCIMENTO,
      this.aREA,
      this.vOTOUEM});

  UserModel.fromJson(Map<String, dynamic> json) {
    mATRICULA = json['MATRICULA'];
    nOME = json['NOME'];
    aSSOCIADO = json['ASSOCIADO'];
    aDMISSAO = json['ADMISSAO'];
    cODEMP = json['CODEMP'];
    cPF = json['CPF'];
    nASCIMENTO = json['NASCIMENTO'];
    aREA = json['AREA'];
    vOTOUEM = json['VOTOU_EM'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MATRICULA'] = this.mATRICULA;
    data['NOME'] = this.nOME;
    data['ASSOCIADO'] = this.aSSOCIADO;
    data['ADMISSAO'] = this.aDMISSAO;
    data['CODEMP'] = this.cODEMP;
    data['CPF'] = this.cPF;
    data['NASCIMENTO'] = this.nASCIMENTO;
    data['AREA'] = this.aREA;
    data['VOTOU_EM'] = this.vOTOUEM;
    return data;
  }
}
