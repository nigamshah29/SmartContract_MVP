pragma solidity ^0.4.4;

contract Coder {

  enum GameState {notStarted, inProgress, pendingApproval, requirementApproved}  //4 states that a "Requirement" object will go through
  GameState public currentState;  //currentState variable that is set to the state the Requirement is in
  address public client;  //ETH wallet address for the client
  address public coderAdmin;  //ETH wallet address for the Coder project admin or PM
  // address public coderUser;  //ETH wallet address for the developer or worker executing on Requirement
  uint256 contract_amount; //expected_hours * project_bill_rate

  modifier onlyState(GameState expectedState) { if(expectedState == currentState) { _; } else { revert(); } }

  //Constructor function to initialize smart contract
  function Coder(address _client, address _coderAdmin, uint256 _contract_amount) {
    client = _client;
    // coderUser = _coderUser;
    coderAdmin = _coderAdmin;
    contract_amount = _contract_amount;
    currentState = GameState.notStarted;
  }

  function startRequirement() onlyState(GameState.notStarted) payable returns (bool) {
      client = msg.sender;
      if (msg.value == contract_amount) {
        currentState = GameState.inProgress;
        return true;
      }
      else {
        revert();
      }
  }

  function approvalRequest() onlyState(GameState.inProgress) returns (bool) {
      currentState = GameState.pendingApproval;
      return true;
  }

  function closeRequirement() onlyState(GameState.pendingApproval) returns (bool){
      currentState = GameState.requirementApproved;
      return true;    
  }

  function payCoder() onlyState(GameState.requirementApproved) payable returns (bool){
    coderAdmin.transfer(this.balance);
    currentState = GameState.notStarted;
    return true;
    selfdestruct(client);
  }

  function getBalance() constant returns (uint256) {
    return this.balance;
  }


}
