pragma solidity 0.5.16;

contract Election {
  // Model a candidate
  struct Candidate {
    uint id;
    string name;
    uint voteCount;
  }

  // r/w candidate
  mapping(uint => Candidate) public candidates;

  // store accounts
  mapping(address => bool) public voters;

  uint public candidatesCount;

  constructor () public {
    addCandidate('cato');
    addCandidate('maja');
  }

  function addCandidate (string memory _name) private {
    candidatesCount ++;
    candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
  }

  function vote (uint _candidateId) public {
    require(!voters[msg.sender]); //this is checking that the address didn't vote before
    require(_candidateId > 0 && _candidateId <= candidatesCount);
    voters[msg.sender] = true;
    candidates[_candidateId].voteCount ++;
  }
}
