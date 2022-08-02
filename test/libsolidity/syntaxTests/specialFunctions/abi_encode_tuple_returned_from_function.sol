contract C {
    function g0() internal {}
    function g1() internal returns (uint) { return (1); }
    function g2() internal returns (uint, uint) { return (2, 3); }

    function f0() public {}
    function f1(uint) public {}
    function f2(uint, uint) public {}

    function h() public view {
        abi.encode(g0());
        abi.encode(g1()); // Ok
        abi.encode(g2());
        abi.encode((g1(), g1()));
    }
}
// ----
// TypeError 2056: (318-322): This type cannot be encoded.
// TypeError 2056: (376-380): This type cannot be encoded.
// TypeError 2056: (402-414): This type cannot be encoded.
