contract Coder {

  enum GameState {notStarted, inProgress, pendingApproval, requirementApproved}  //4 states that a "Requirement" object will go through
  GameState public currentState;  //currentState variable that is set to the state the Requirement is in
  address public client;  //ETH wallet address for the client
  address public coderAdmin;  //ETH wallet address for the Coder project admin or PM
  address public coderUser;  //ETH wallet address for the developer or worker executing on Requirement
  uint256 expected_hours;  //cumulative expected hours from all the tasks listed under the Requirement
  uint256 project_bill_rate;  //client bill rate for project type submitted (Accelerate, Startup, Small Business, Enterprise)

  modifier onlyState(GameState expectedState) { if(expectedState == currentState) { _; } else { throw; } }

  //Constructor function to initialize smart contract
  function Coder(uint256 _expected_hours, uint256 _project_bill_rate) {
    expected_hours = _expected_hours;
    project_bill_rate = _project_bill_rate;
    currentState = GameState.notStarted;
  }

  function startRequirement() onlyState(GameState.notStarted) payable returns (bool) {
      escrowRequested = expected_hours * project_bill_rate;
      escrowReceived = msg.value;
      client = msg.sender;
      if (escrowReceived == escrowRequested) {
        currentState = GameState.inProgress;
        alert("Proper Payment received! Coder will begin working on requirement.");
        return true;
      }
      else {
        alert("Improper Payment received. Please send the proper escrow amount.");
        throw;
      }
  }

  function approvalRequest() onlyState(GameState.inProgress) returns (bool) {
      alert("Requirement is complete. Please approve requirement");
      currentState = GameState.pendingApproval;
      return true;
  }

  function closeRequirement(clientApproval) onlyState(GameState.pendingApproval) returns (bool){
      if (clientApproval){
        currentState = GameState.requirementApproved;
        return true;    
      }
      else {
        currentState = GameState.inProgress;
        false;
      }
  }

  function payCoder() onlyState(GameState.requirementApproved) payable returns (bool){
    coderAdmin.send(this.balance * .75);
    coderUser.send(this.balance * .25);
    currentState = GameState.notStarted
    return true;
  }


}
