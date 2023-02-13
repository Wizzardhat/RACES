// SPDX-License-Identifier: MIT
pragma solidity 0.7.0;

import {InSecureumToken} from "../InSecureum.sol";
import {Setup} from "./Setup.sol";

contract EchidnaTest is Setup {
    event AssertionFailed(uint256 tokens);

    function test_it_always_passess() public pure {
        assert(true);
    }

    function total_supply_is_always_le_than_max_supply() public {
        // preconditions
        uint256 max_supply = max_supply();
        uint256 total_supply = token.totalSupply();
        // postconditions
        assert(total_supply <= max_supply);
    }
}
