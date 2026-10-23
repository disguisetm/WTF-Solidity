// SPDX-License-Identifier: MIT
pragma solidity ^0.8.34;

contract Owner {
    // 定义owner变量
    address public owner;

    // 构造函数
    constructor(address initialOwner) {
        // 在部署合约的时候，将owner设置为传入的initialOwner地址
        owner = initialOwner;
    }

    // 定义modifier
    modifier onlyOwner {
        // 检查调用者是否为owner地址
        require(msg.sender == owner);
        // 如果是的话，继续运行函数主体；否则报错并revert交易
        _;
    }

    // 定义一个带onlyOwner修饰符的函数
    function changeOwner(address _newOwner) external onlyOwner {
        // 只有owner地址运行这个函数，并改变owner
        owner = _newOwner;
    }
}