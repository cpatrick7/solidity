contract C {
    function g0() internal {}
    function g1() internal returns (uint) { return (1); }
    function g2() internal returns (uint, uint) { return (2, 3); }

    function f0() public {}
    function f1(uint) public {}
    function f2(uint, uint) public {}

    function h() public view {
        abi.encodeWithSelector(this.f0.selector, g0());
        abi.encodeWithSelector(this.f0.selector, g1()); // Ok
        abi.encodeWithSelector(this.f0.selector, g2());
        abi.encodeWithSelector(this.f0.selector, (g1(), g1()));
    }
}
// ----
// TypeError 2056: (348-352): This type cannot be encoded.
// TypeError 2056: (466-470): This type cannot be encoded.
// TypeError 2056: (522-534): This type cannot be encoded.
