pragma solidity ^0.8.0;

contract Counter{
    uint Counter = 0;

    function add(uint x) public returns(uint){
            return Counter += x;

    }
}