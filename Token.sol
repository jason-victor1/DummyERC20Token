// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Token {
    mapping(address => uint256) private _balances;
    address public owner;
    uint256 public totalSupply;

    constructor(uint256 initialSupply) {
        owner = msg.sender;
        totalSupply = initialSupply;
        _balances[msg.sender] = initialSupply;
    }

    function transfer(address to, uint256 amount) public {
        require(_balances[msg.sender] >= amount, "Insufficient balance");
        _balances[msg.sender] -= amount;
        _balances[to] += amount;
    }

    function mint(uint256 amount) public {
        totalSupply += amount;
        _balances[msg.sender] += amount;
    }
}
