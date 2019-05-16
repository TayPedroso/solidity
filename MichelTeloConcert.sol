pragma solidity 0.5.8;

contract MichelTeloConcert {
    
   string public contratante;
   string public contratada;
   string public representanteLegal;
   uint256 valorDoContrato;
   uint256 percentualRepresentanteLegal;
   uint256 percentualContratante;
   uint256 percentualContratada;
   uint256 despesasAlvarasEDireitoAutorais;
   uint256 despesasTransporteHospedagemRefeicoes;
   address payable private contaContratante;
   address payable private contaContratada;
   address payable private contaRepresentanteLegal;
   uint public prazoPagtoAposConcert;
   uint public fatorMultaAtraso;
   
  constructor(address payable _contaContratante,address payable _contaContratada,address payable _contaRepresentanteLegal) public { 
       contratante = "ticketForFun" ;
       contratada =  "michelTelo";
       representanteLegal = "jeff";
       valorDoContrato = 80000000;
       percentualRepresentanteLegal = 5;
       percentualContratante = 25;
       percentualContratada = 50;
       despesasAlvarasEDireitoAutorais = 10;
       despesasTransporteHospedagemRefeicoes = 10;
       prazoPagtoAposConcert = 30;
       fatorMultaAtraso = 2;
       contaContratante = _contaContratante;
       contaContratada =  _contaContratada;
       contaRepresentanteLegal = _contaRepresentanteLegal;
       
   }
   
   function calculaValorRepresentanteLegal () public view returns (uint256) {
      uint256 valorRepresentante =(valorDoContrato*percentualRepresentanteLegal)/100;
      return valorRepresentante;


  }
    function valorDespesaHospedagem () public view returns (uint256) {
    uint256 valorHospedagem = (valorDoContrato*despesasTransporteHospedagemRefeicoes)/100;
    return valorHospedagem;
    
   }
    function valorDireitosAutorais () public view returns (uint256) {
    uint256 valorDireitoAutoral = (valorDoContrato*despesasAlvarasEDireitoAutorais)/100;
    return valorDireitoAutoral;
    
        
    }
   
   
    function calculaValorContratante ()  public view returns (uint256) {
    
    uint256 valorContratante = 0;
    
    if (prazoPagtoAposConcert > 30) { 

        valorContratante = (((valorDoContrato*percentualContratante)/100) * fatorMultaAtraso)/100;
        
    }  else {
    
        valorContratante = (valorDoContrato*percentualContratante)/100;

    }
    
    return valorContratante;
    
    }
    
    
    function calculaValorContratada ()  public view returns (uint256) {
        uint256 valorContratada = (valorDoContrato*percentualContratada)/100;
            return valorContratada;
    } 
    
}
