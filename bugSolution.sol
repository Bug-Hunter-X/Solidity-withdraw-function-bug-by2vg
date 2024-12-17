```solidity
function withdraw() public {
  uint amount = balances[msg.sender];
  require(amount > 0, "Insufficient balance");
  payable(msg.sender).transfer(amount);
  balances[msg.sender] = 0; // Correct: Update balance *after* successful transfer
}
```