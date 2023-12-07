// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.0 <= 0.9.0;

contract Donors {
    // Mapping to track the amount donated by each address
    mapping(address => uint) public amountDonatedBy;

    // Mapping to track the number of donations made by each address
    mapping(address => uint) public numberOfDonationsBy;

    // The owner of the contract who can withdraw funds
    address payable public owner;

    // Total balance collected from donations
    uint public balanceCollectedSoFar;

    // Total amount withdrawn by the owner
    uint public amountWithdrawnSoFar;

    // Total number of donations made
    uint public numberOfDonationsSoFar;

    // Total number of withdrawals made by the owner
    uint public numberOfWithdrawalsSoFar;

    // Event triggered when a donation is made
    event Donation(uint id, address indexed from, uint amount, uint timestamp);

    // Event triggered when a withdrawal is made by the owner
    event Withdrawal(uint id, address indexed to, uint amount, uint timestamp);

    constructor() {
        owner = payable(msg.sender);
    }

    /**
     * @dev Function to allow users to make a donation.
     */
    function donate() payable public {
        require(msg.value > 0, "Invalid donation amount!");

        // Update individual donation and total donation statistics
        amountDonatedBy[msg.sender] += msg.value;
        numberOfDonationsBy[msg.sender]++;
        balanceCollectedSoFar += msg.value;
        numberOfDonationsSoFar++;

        // Emit a Donation event with a unique id (using numberOfDonationsSoFar)
        emit Donation(numberOfDonationsSoFar, msg.sender, msg.value, block.timestamp);
    }

    /**
     * @dev Function to allow the owner to withdraw funds.
     * @param _amountToWithdraw The amount to be withdrawn by the owner.
     */
    function withdraw(uint _amountToWithdraw) public {
        require(msg.sender == owner, "Unauthorized personnel!");
        require(balanceCollectedSoFar >= _amountToWithdraw, "Insufficient balance!");

        // Update withdrawal statistics
        balanceCollectedSoFar -= _amountToWithdraw;
        amountWithdrawnSoFar += _amountToWithdraw;
        numberOfWithdrawalsSoFar++;

        // Transfer the requested amount to the owner
        (bool isSent,) = owner.call{value: _amountToWithdraw}("");
        require(isSent, "Withdrawal failed!");

        // Emit a Withdrawal event with a unique id (using numberOfWithdrawalsSoFar)
        emit Withdrawal(numberOfWithdrawalsSoFar, owner, _amountToWithdraw, block.timestamp);
    }
}
