contract C {
    function g0() internal {}
    function g1() internal returns (uint) { return (1); }
    function g2() internal returns (uint, uint) { return (2, 3); }

    function f0() public {}
    function f1(uint) public {}
    function f2(uint, uint) public {}

    function h() public view {
        abi.encodePacked(g0());
        abi.encodePacked(g1()); // Ok
        abi.encodePacked(g2());
        abi.encodePacked((g1(), g1()));
    }
}
// ----
// TypeError 2056: (324-328): This type cannot be encoded.
// TypeError 2056: (394-398): This type cannot be encoded.
// TypeError 2056: (426-438): This type cannot be encoded.
