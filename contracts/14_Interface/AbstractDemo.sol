// SPDX-License-Identifier: MIT
pragma solidity ^0.8.34;

abstract contract Base {
    string public name = "Base";

    function getAlias() public pure virtual returns (string memory);

    function getAlias2() public pure returns (string memory) {
        return "getAlias2";
    }
}

contract BaseImpl is Base {
    function getAlias() public pure override returns (string memory) {
        return "BaseImpl";
    }
}