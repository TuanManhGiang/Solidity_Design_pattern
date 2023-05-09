pragma solidity >=0.7.0 < 0.9.0;
contract Ownable {
    address owner;
    constructor() public {
        owner = msg.sender;
    }
    modifier onlyOwnable(){
        require (msg.sender == owner);
        _;
        
    }

}
contract dividendContract is  Ownable {
    address[] public investors;
    
    function registerInvestor(address _investor) public onlyOwnable{
        require(_investor!=address(0));
        investors.push(_investor);
    }
    function calculateDividend(investors[i]) internal public returns(uint){
        // dividend calculate here
        return 2; 
    }
    // BAD PRACTICE
    function distributeDividend() public onlyOwnable{
        for(int i=0;i<investors.length;i++){
            uint amount = calculateDividend(investors[i]);
            investors[i].transfer(amount);

        }
        
    }
}