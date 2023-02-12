// SPDX-License-Identifier: MIT
pragma solidity 0.7.0;

import {InSecureumToken} from "../InSecureum.sol";

contract Setup is InSecureumToken {
    address alice;
    address bob;
    InSecureumToken token;

    constructor() payable {
        InSecureumToken token = new InSecureumToken();
        address alice = msg.sender;
        address bob = address(0x1234);
    }

    function wrapped_safe_add(uint256 a, uint256 b) public returns (uint256) {
        return safeAdd(a, b);
    }
}
