contract C {
    event Ev();
    error Er();

    function g0() internal {}
    function g1() internal returns (uint) { return (1); }
    function g2() internal returns (uint, uint) { return (2, 3); }

    function f0() public {}
    function f1(uint) public {}
    function f2(uint, uint) public {}

    function h() public view {
        uint a;
        uint b;

        abi.encodeCall(this.f1, (1) + (2)); // Ok
        abi.encodeCall(this.f2, (1, 1) + (2, 2));
        abi.encodeCall(this.f0, Ev() / Er());
        abi.encodeCall(this.f0, !());
    }
}
// ----
// TypeError 2271: (447-462): Operator + not compatible with types tuple(int_const 1,int_const 1) and tuple(int_const 2,int_const 2)
// TypeError 9062: (447-462): Expected an inline tuple, not an expression of a tuple type.
// TypeError 2271: (497-508): Operator / not compatible with types tuple() and tuple()
// TypeError 9062: (497-508): Expected an inline tuple, not an expression of a tuple type.
// TypeError 4907: (543-546): Unary operator ! cannot be applied to type tuple()
// TypeError 9062: (543-546): Expected an inline tuple, not an expression of a tuple type.
