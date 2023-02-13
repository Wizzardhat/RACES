// SPDX-License-Identifier: MIT
pragma solidity 0.7.0;

import {InSecureumToken} from "../InSecureum.sol";

contract User {
    function proxy(address target, bytes memory data)
        public
        returns (bool success, bytes memory returnData)
    {
        return target.call(data);
    }
}

contract Setup {
    User alice;
    User bob;
    InSecureumToken token;

    constructor() {
        token = new InSecureumToken();
        alice = new User();
        bob = new User();
    }

    /// @dev Since safeAdd is internal and we are using External testing setup
    /// it is neccessary to expose this function for Echidna to test with.
    function exposed_safeAdd(uint256 a, uint256 b)
        internal
        pure
        returns (uint256)
    {
        if (a + b < a) {
            revert();
        }
        return a + b;
    }

    /// @dev This is a wrapper function (getter) for Echidna to get max supply
    function max_supply() public pure returns (uint256) {
        return 100 ether;
    }

    function _between(
        uint256 amount,
        uint256 low,
        uint256 high
    ) internal pure returns (uint256) {
        return (low + (amount % (high - low + 1)));
    }
}
