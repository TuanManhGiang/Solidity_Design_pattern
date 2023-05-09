pragma solidity  >=0.7.0 <0.9.0;
contract Ownerble {
    address owner;
    constructor(){
        owner = msg.sender;
    }
    modifier onlyOwnable {
        require(msg.sender == owner);
        _;
    }

}
contract PullOverPush is Ownerble{
    address [] investors;
    mapping(address=>uint) balances;
    function registerInvestor(address _investor) public onlyOwnable{
        require(_investor!= address(0));
        investors.push(_investor);
    }
    function calculateDividend(address _investor)  public returns(uint){
        // dividend calculate here 
        return 2;
    }
    function distributeDividend() public onlyOwnable {
        for(uint i=0;i<investors.length;i++){
            uint amount = calculateDividend(investors[i]);
            balances[investors[i]]=amount;
        }
        
    }
    function claimDividend() public payable{
        uint amount = balances[msg.sender];
        require(amount>0);
        // ensure to update balance before tranfer
        // to avoid reentrancy attack
        balances[msg.sender]=0;
        payable(msg.sender).transfer(amount);
    }

}