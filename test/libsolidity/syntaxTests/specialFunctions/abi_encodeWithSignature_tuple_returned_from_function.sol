contract C {
    function g0() internal {}
    function g1() internal returns (uint) { return (1); }
    function g2() internal returns (uint, uint) { return (2, 3); }

    function f0() public {}
    function f1(uint) public {}
    function f2(uint, uint) public {}

    function h() public view {
        abi.encodeWithSignature("f0()", g0());
        abi.encodeWithSignature("f()", g1()); // Ok
        abi.encodeWithSignature("f()", g2());
        abi.encodeWithSignature("f()", (g1(), g1()));
    }
}
// ----
// TypeError 2056: (339-343): This type cannot be encoded.
// TypeError 2056: (437-441): This type cannot be encoded.
// TypeError 2056: (483-495): This type cannot be encoded.
