// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract bank{
    // mapping(address => uint) public balanceOf;
    address token;
    mapping(address=>uint) public deposited;

    constructor(address _token){
        token = _token;

    }

    function deposit(address user,uint amounts) external {
        require(ERC20(token).transferFrom(msg.sender,address(this),amounts),"transfer from error");
        // IERC20(token).transferFrom(msg.sender,address(this),amounts);
        deposited[user] += amounts;
    }

    function getbalance() public returns(uint){
        address account = address(this);
        return IERC20(token).balanceOf(account);
    }
   
    function withdraw(uint amounts)public {
        require(amounts<=deposited[msg.sender],"out of balance");
       
        ERC20(token).transfer(msg.sender,amounts);
        //ERC20(token).increaseAllowance(address(this),amounts);
    //     bytes memory payload = abi.encodeWithSignature("increaseAllowance(address,uint256)",address(this),amounts);
    //    (bool success,bytes memory data) = address(msg.sender).call(payload);//无法自动恢复授权合约
        
        deposited[msg.sender] -= amounts;
    }
}  