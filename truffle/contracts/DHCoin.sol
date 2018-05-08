pragma solidity ^0.4.18;
import "openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

contract DHCoin is StandardToken {

    string public name = "DHCoin";
    string public symbol = "DH";
    uint public decimals = 18;

    address public owner;
    mapping (address => string) public thanksMessage;
    uint public maxSupply;

    constructor(uint _initialSupply, uint _maxSupply) public {
        owner = msg.sender;
        totalSupply_ = _initialSupply;
        maxSupply = _maxSupply;
        balances[msg.sender] = _initialSupply;
    }

    // 追加発行
    function addTotalSupply(uint256 _value) public {
        require(owner == msg.sender);
        require(maxSupply >= (totalSupply_ + _value));

        totalSupply_ += _value;
        balances[msg.sender] += _value;
    }

    // ありがとうメッセージを送ると、100DHも一緒に送られる
    function thanks(address _to, string _message) public {
        transfer(_to, 100e18);
        thanksMessage[_to] = _message;
    }

    // 最新ありがとうメッセージを見る
    function thanksMessage(address _address) public constant returns (string) {
        return thanksMessage[_address];
    }

}