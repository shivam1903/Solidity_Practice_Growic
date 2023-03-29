// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Data_type{

    int256 ex_i256 = -(2**255 - 1);
    int128 ex_i128 = -(2**127 - 1);
    int64 ex_i64 = -(2**63 - 1);
    int32 ex_i32 = -(2**31 - 1);

    uint256 ex_ui256 = (2**256) - 1;
    uint128 ex_ui128 = (2**128) - 1;
    uint64 ex_ui64 = (2**64) - 1;
    uint32 ex_ui32 = (2**32) - 1;

    bool thisis_true = true;
    bool this_is_default; //false

    address my_addr = 0xFdCae8094Ca2Ad8570b725D80D89DFe6F42517cf;
    address my_addr2 = 0xe166E2Ea2Ef004dbC6a730dbe240BEa7e57a38a7;

    enum Check{
        WORKING,
        NOT_WORKING
    }

    bytes1 ab = 0x00;
    bytes1 ab2 = 0x01;


}