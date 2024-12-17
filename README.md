# Solidity Withdraw Function Bug

This repository demonstrates a common bug in Solidity's `withdraw` function and its solution.

## Bug Description
The original `withdraw` function has a race condition.  The balance is set to zero *before* the transfer. If the transfer fails (due to insufficient gas, for example), the user loses their funds because their balance is already zero.

## Solution
The solution involves transferring the funds first, then updating the balance. This ensures that even if the transfer fails, the user's balance remains intact.

## How to reproduce
1. Compile and deploy the buggy contract.
2. Deposit funds into the contract.
3. Simulate a low-gas environment or induce an error in the `transfer` function. Observe that the user's balance is zero, even though the transfer failed.  
4. Deploy the corrected contract and repeat steps 2 and 3 to compare the different outcomes.