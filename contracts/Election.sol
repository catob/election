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

  uint public candidatesCount;

  constructor () public {
    addCandidate('cato');
    addCandidate('maja');
  }

  function addCandidate (string memory _name) private {
    candidatesCount++;
    candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
  }
}
