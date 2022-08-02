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

        abi.encodeCall(this.f0, () = g0());
        abi.encodeCall(this.f0, () = ());
        abi.encodeCall(this.f1, (a) = g1()); // Ok
        abi.encodeCall(this.f1, (a) = (1)); // Ok
        abi.encodeCall(this.f2, (a, b) = g2());
        abi.encodeCall(this.f2, (a, b) = (2, 3));
    }
}
// ----
// TypeError 5547: (364-366): Empty tuple on the left hand side.
// TypeError 9062: (364-373): Expected an inline tuple, not an expression of a tuple type.
// TypeError 5547: (408-410): Empty tuple on the left hand side.
// TypeError 9062: (408-415): Expected an inline tuple, not an expression of a tuple type.
// TypeError 9062: (551-564): Expected an inline tuple, not an expression of a tuple type.
// TypeError 9062: (599-614): Expected an inline tuple, not an expression of a tuple type.
