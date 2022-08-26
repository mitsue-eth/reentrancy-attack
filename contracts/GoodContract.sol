//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract GoodContract {
    mapping(address => uint256) public balances;

    //update balance to reflect new eth deposited by msg.sender
    function addBalance() public payable {
        balances[msg.sender] += msg.value;
    }

    //send all eth of msg.sender to him back
    function withdraw() public {
        require(balances[msg.sender] > 0);
        (bool sent, ) = msg.sender.call{value: balances[msg.sender]}("");
        require(sent, "Failed to send ether");
        //unreachable code
        balances[msg.sender] = 0;
    }
}
