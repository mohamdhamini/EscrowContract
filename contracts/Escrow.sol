// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Escrow {

    address public buyer;
    address public seller;
    address public arbiter;
    uint256 public amount;
    bool public buyerApproved;
    bool public sellerApproved;

    constructor(address _buyer, address _seller, address _arbiter) {
        buyer = _buyer;
        seller = _seller;
        arbiter = _arbiter;
        amount = 0;
        buyerApproved = false;
        sellerApproved = false;
    }

    // Deposit function by the buyer
    function deposit() external payable {
        require(msg.sender == buyer, "Only buyer can deposit");
        amount = msg.value;
    }

    // Buyer approves the transaction
    function approveByBuyer() external {
        require(msg.sender == buyer, "Only buyer can approve");
        buyerApproved = true;
    }

    // Seller approves the transaction
    function approveBySeller() external {
        require(msg.sender == seller, "Only seller can approve");
        sellerApproved = true;
    }

    // Release funds when both parties approve
    function releaseFunds() external {
        require(msg.sender == arbiter || (buyerApproved && sellerApproved), "Not authorized");
        require(amount > 0, "No funds to release");

        payable(seller).transfer(amount);

        // Reset state for the next transaction
        amount = 0;
        buyerApproved = false;
        sellerApproved = false;
    }

    // Refund funds to the buyer in case of dispute
    function refundBuyer() external {
        require(msg.sender == arbiter, "Only arbiter can refund");
        require(amount > 0, "No funds to refund");
        payable(buyer).transfer(amount);

        // Reset state after refund
        amount = 0;
        buyerApproved = false;
        sellerApproved = false;
    }
}
