// SPDX-License-Identifier: MIT
pragma solidity ^0.8.34;


error SendFailed();
error CallFailed();

contract SendETH {
    // 构造函数，payable使得部署的时候可以转eth进去
    constructor() payable {}

    // receive方法，接收eth时被触发
    receive() external payable { }

    function transferETH(address payable _to, uint256 amount) external payable {
        _to.transfer(amount);
    }

    // send()发送ETH
    function sendETH(address payable _to, uint256 amount) external payable{
        // 处理下send的返回值，如果失败，revert交易并发送error
        bool success = _to.send(amount);
        if (!success) {
            revert SendFailed();
        }
    }

      function callETH(address payable _to, uint256 amount) external payable {
        (bool success,) = _to.call{value: amount}("");
        if (!success) {
            revert SendFailed();
        }
    }

}

contract ReceiveETH {
    event Log(uint amount, uint gas);

    receive() external payable {
        emit Log(msg.value, gasleft());
    }

    function getBalance() view public returns (uint) {
        return address(this).balance;
    }
}