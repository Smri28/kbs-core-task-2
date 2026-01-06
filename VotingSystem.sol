// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingPoll {
    mapping(address => bool) public voter;  
    mapping(uint => uint) public votes;     

    modifier hasNotVoted() {
        require(!voter[msg.sender], "Already voted");
        _;
    }

    function vote(uint id) external hasNotVoted {
        votes[id]++;                
        voter[msg.sender] = true; 
    }


    function getVotes(uint id) external view returns (uint) {
        return votes[id];
    }
}