// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TaskContract {
    address public employer;
    address public employee;
    uint public paymentAmount;
    bool public taskCompleted;

    constructor(address _employee, uint _paymentAmount) {
        employer = msg.sender;
        employee = _employee;
        paymentAmount = _paymentAmount;
        taskCompleted = false;
    }

    function markTaskCompleted() public {
        require(msg.sender == employer, "Only employer can mark task as completed");
        taskCompleted = true;
    }

    function releasePayment() public {
        require(taskCompleted, "Task must be completed before releasing payment");
        require(msg.sender == employer, "Only employer can release payment");
        payable(employee).transfer(paymentAmount);
    }

    receive() external payable {}
}
