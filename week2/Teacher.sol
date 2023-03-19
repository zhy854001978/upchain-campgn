pragma solidity ^0.8.0;



interface IScore {
    
    function setScore(address student, uint score) external;
    function getScore(address student) external view returns (uint);
}
contract Teacher {

    IScore public Score ;
    address owner;

    constructor(IScore _score){
        Score = _score;
        owner = msg.sender;

    }
    modifier onlyTeacher() {
        require(msg.sender == owner);
        _;
    }
    
    
    function setScore(address student, uint score) public onlyTeacher {
        require(score <= 100);
        Score.setScore(student, score);
    }
    
    function getScore(address student) public view returns (uint) {
        return Score.getScore(student);
    }
}