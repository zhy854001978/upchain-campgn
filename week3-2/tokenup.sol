// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract YCDTokenV1 is ERC20 {
    address public impl;
    constructor(uint256 initialSupply) ERC20("YCD", "YCD") {
        _mint(msg.sender, initialSupply);
    }

    
}

contract YCDTokenProxy{
    address public impl;

    function setimpl(address _impl) external{
        impl = _impl;

    }
    fallback() external payable{
        (bool success,bytes memory data ) = impl.delegatecall(msg.data);
    }
}


contract YCDTokenV2 is ERC20 {
    address public impl;
    constructor(uint256 initialSupply) ERC20("YCD", "YCD") {
        _mint(msg.sender, initialSupply);
    }


    function transferWithCallback(address recopient,uint amount) external returns(bool){
        transferFrom(msg.sender,recopient,amount);
    }

}

