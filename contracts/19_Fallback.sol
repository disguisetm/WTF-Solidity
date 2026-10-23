// SPDX-License-Identifier: MIT
pragma solidity ^0.8.34;

contract Fallback {
    /* 触发fallback() 还是 receive()?
           接收ETH
              |
         msg.data是空？
            /  \
          是    否
          /      \
receive()存在?   fallback()
        / \
       是  否
      /     \
receive()  fallback   
    */
    event receivedCalled(address Sender, uint value);
    event fallbackCalled(address Sender, uint value, bytes Data);

    receive() external payable { 
        emit receivedCalled(msg.sender, msg.value);
    }

    fallback() external payable {
        emit fallbackCalled(msg.sender, msg.value, msg.data);
    }

}