// SPDX-License-Identifier: MIT
pragma solidity 0.7.0;

import {InSecureumToken} from "../InSecureum.sol";
import {Setup} from "./Setup.sol";

contract EchidnaTest is Setup {
    event AssertionFailed(uint256 tokens);

    function test_it_always_passess() public {
        assert(true);
    }

    // function sum_should_be_greater_than_addends(uint256 a, uint256 b) public {
    //     assert(wrapped_safe_add(a, b) >= b);
    //     assert(wrapped_safe_add(a, b) >= a);
    // }

    // For each token minted for alice, contract gets 1 ether
    function test_no_free_mint(uint256 desiredTokens, uint256 etherSent)
        public
    {
        // pre-conditions
        desiredTokens = _between(desiredTokens, 10, 100);
        etherSent = _between(etherSent, 0, 1 ether);
        uint256 senderTokenBalanceBefore = balances[msg.sender];
        uint256 contractEtherBalanceBefore = address(token).balance;
        emit AssertionFailed(desiredTokens);
        emit AssertionFailed(address(msg.sender).balance);
        emit AssertionFailed((desiredTokens / 10) * 10**18);
        // action
        token.buy{value: etherSent}(desiredTokens);

        // post-conditions
        uint256 senderTokenBalanceAfter = balances[msg.sender];
        uint256 contractEtherBalanceAfter = address(token).balance;
        assert(
            senderTokenBalanceAfter == senderTokenBalanceBefore + desiredTokens
        );
        assert(contractEtherBalanceAfter > contractEtherBalanceBefore);
    }
}
