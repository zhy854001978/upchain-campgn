// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Bank {
    address[] depositors;

    mapping(address => uint) public balances;

    receive() external payable {
        balances[msg.sender] += msg.value;
        depositors.push(msg.sender);
    }

    function withdraw(uint amount) external {
        balances[msg.sender] -= amount;
        L.transferEth(msg.sender, amount);
    }

    function withdrawAll() external {
        uint amount = balances[msg.sender];
        delete balances[msg.sender];
        L.transferEth(msg.sender, amount);
    }

    function getdepositors() public view returns(address[] memory){
        return depositors;
    }
}

library L {
    function transferEth(address to, uint value) internal {
        (bool success,) = to.call{value: value}("");
        require(success, "transfer eth failed!");
    }
}
 