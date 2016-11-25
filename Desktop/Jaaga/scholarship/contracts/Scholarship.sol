pragma solidity ^0.4.2;

contract token {function transfer (address reciever, uint amount){}}
contract Scholarship{
  address public beneficiary;
  uint public fundingGoal;
  uint public amountRaised;
  uint public deadline;
  uint public price;
  token public tokenReward;
  mapping (address => uint) public balanceOf;
  bool fundingGoalReached = false;
  event GoalReached(address beneficiary, uint amountRaised);
  event FundTransfer(address backer, uint amont, bool isContribution);
  bool crowdsaleClosed= false;
// setting up owner
  function Scholarship(
    address ifSuccessfulSendTo,
    uint fundingGoalInEthers,
    uint durationInMinutes,
    uint etherCostofEachToken,
    token addressofTokenUsedAsReward
    ) {
      beneficiary = ifSuccessfulSendTo;
      fundingGoal = fundingGoalInEthers * 1 ether;
      deadline= now + durationInMinutes * 1 minutes;
      price = etherCostofEachToken * 1 ether ;
      tokenReward =  token(addressofTokenUsedAsReward);
    }

    function () payable {
      if (crowdsaleClosed) throw;
      uint amount = msg.value ;
      balanceOf[msg.sender] = amount;
      amountRaised += amount;
      tokenReward.transfer(msg.sender, amount / price);
      FundTransfer(msg.sender, amount, true);

    }
    modifier afterDeadline(){ if (now>=deadline) _;}

    function checkGoalReached() afterDeadline{
      if (amountRaised >= fundingGoal) {
        fundingGoalReached =true ;
        GoalReached(beneficiary, amountRaised);

      }
      crowdsaleClosed = true;
    }
    function safeWithdrawal () afterDeadline {
      if (!fundingGoalReached) {
        uint amount = balanceOf[msg.sender];
        balanceOf[msg.sender] = 0;
        if (amount> 0){
          if (msg.sender.send(amount)) {
            FundTransfer(msg.sender, amount, false);
          } else {
            balanceOf[msg.sender]= amount;
          }
        }
      }
    if (fundingGoalReached && beneficiary == msg.sender) {
      if (beneficiary.send(amountRaised)) {
        FundTransfer(beneficiary, amountRaised, false);
      } else {
        fundingGoalReached = false;
      }
    }
    }
}
