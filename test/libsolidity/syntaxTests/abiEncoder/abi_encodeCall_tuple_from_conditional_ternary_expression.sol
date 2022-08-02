contract C {
    function g0() internal {}
    function g1() internal returns (uint) { return (1); }
    function g2() internal returns (uint, uint) { return (2, 3); }

    function f0() public {}
    function f1(uint) public {}
    function f2(uint, uint) public {}

    function h() public view {
        uint a;
        uint b;

        abi.encodeCall(this.f0, true ? g0() : g0());
        abi.encodeCall(this.f1, true ? (1) : (2)); // Ok
        abi.encodeCall(this.f1, true ? g1() : g1()); // Ok
        abi.encodeCall(this.f2, true ? g2() : g2());
        abi.encodeCall(this.f2, true ? (1, 2) : (3, 4));
    }
}
// ----
// TypeError 9062: (364-382): Expected an inline tuple, not an expression of a tuple type.
// TypeError 9062: (533-551): Expected an inline tuple, not an expression of a tuple type.
// TypeError 9062: (586-608): Expected an inline tuple, not an expression of a tuple type.
