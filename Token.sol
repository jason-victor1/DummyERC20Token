// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Token {
    mapping(address => uint256) private _balances;
    address public owner;
    uint256 public totalSupply;

    // Events
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Mint(address indexed to, uint256 value);

    // Modifier to restrict access to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    constructor(uint256 initialSupply) {
        owner = msg.sender;
        totalSupply = initialSupply;
        _balances[msg.sender] = initialSupply;
    }

    function transfer(address to, uint256 amount) public {
        require(to != address(0), "Transfer to zero address"); // Prevent zero address transfers
        uint256 senderBalance = _balances[msg.sender];
        require(senderBalance >= amount, "Insufficient balance");
        unchecked {
            // Optimize for gas efficiency
            _balances[msg.sender] = senderBalance - amount;
            _balances[to] += amount;
        }
        emit Transfer(msg.sender, to, amount); // Emit transfer event
    }

    function mint(uint256 amount) public onlyOwner {
        totalSupply += amount;
        _balances[msg.sender] += amount;
        emit Mint(msg.sender, amount); // Emit mint event
    }
}
