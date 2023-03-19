pragma solidity ^0.8.0;


interface IScore {
    
    function setScore(address student, uint score) external ;
    function getScore(address student) external view  returns (uint);
}

contract Score is IScore{
    mapping(address=>uint)scoreOfStudent;
    function setScore(address student, uint score) external{
        scoreOfStudent[student] = score;
    }

    function getScore(address student) external view returns(uint){
        return scoreOfStudent[student];
    }
    
}