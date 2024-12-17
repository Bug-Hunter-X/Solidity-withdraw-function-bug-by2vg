```solidity
function withdraw() public {
  uint amount = balances[msg.sender];
  require(amount > 0, "Insufficient balance");
  balances[msg.sender] = 0; // Bug: This line overwrites the balance to zero before transfer
  payable(msg.sender).transfer(amount);
}
```