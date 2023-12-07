# Donors Smart Contract

This Solidity smart contract, named "Donors," facilitates donations and withdrawals. Users can make donations, and the owner of the contract can withdraw funds.

## Contract Details
- **Contract Name:** Donors
- **Solidity Version:** 0.8.0 <= 0.9.0
- **License:** MIT

## Contract Overview
The Donors contract provides the following functionalities:
- Users can make donations to the contract.
- The contract tracks the amount donated by each address and the number of donations made by each address.
- The owner of the contract can withdraw funds, and the contract tracks the total amount withdrawn by the owner.

## State Variables
- **`amountDonatedBy`:** Mapping to track the amount donated by each address.
- **`numberOfDonationsBy`:** Mapping to track the number of donations made by each address.
- **`owner`:** The address of the contract owner who can withdraw funds.
- **`balanceCollectedSoFar`:** Total balance collected from donations.
- **`amountWithdrawnSoFar`:** Total amount withdrawn by the owner.
- **`numberOfDonationsSoFar`:** Total number of donations made.
- **`numberOfWithdrawalsSoFar`:** Total number of withdrawals made by the owner.

## Events

- **`Donation(uint id, address indexed from, uint amount, uint timestamp)`:** Triggered when a donation is made. The `id` is a unique identifier for each donation.
- **`Withdrawal(uint id, address indexed to, uint amount, uint timestamp)`:** Triggered when a withdrawal is made by the owner. The `id` is a unique identifier for each withdrawal.

## Functions
### `donate()`
Allows users to make a donation to the contract. Updates individual and total donation statistics and emits a `Donation` event.

### `withdraw(uint _amountToWithdraw)`
Allows the owner to withdraw funds from the contract. Updates withdrawal statistics, transfers funds to the owner, and emits a `Withdrawal` event.

## Usage
1. Deploy the Donors contract.
2. Users can make donations using the `donate` function.
3. The owner can withdraw funds using the `withdraw` function.