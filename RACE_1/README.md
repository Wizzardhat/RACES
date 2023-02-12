# Race 1

## Contract Invariants

1. No user should have more tokens than MAX_SUPPLY.
2. If amount of user tokens is lesser than the amount sent, the transfer should always revert.
3. There should be no free tokens in transfer from.
4. For `x` amount of Ether user should have `x * 10` tokens.
5. Total supply should be smaller or equal MAX SUPPLY.
6. No free tokens when minting tokens.

- Total supply after should be equal total supply before + amount minted
- User balance should be equal balance before + amount minted

7. Safe add sum should be always greater than addends. ✅
