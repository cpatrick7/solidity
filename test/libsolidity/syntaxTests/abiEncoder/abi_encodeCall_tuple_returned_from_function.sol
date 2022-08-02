contract C {
    function g0() internal {}
    function g1() internal returns (uint) { return (1); }
    function g2() internal returns (uint, uint) { return (2, 3); }

    function f0() public {}
    function f1(uint) public {}
    function f2(uint, uint) public {}

    function h() public view {
        abi.encodeCall(this.f0, g0());
        abi.encodeCall(this.f1, g1()); // Ok
        abi.encodeCall(this.f2, g2());

        abi.encodeCall(this.f0, (g0()));
        abi.encodeCall(this.f1, (g1())); // Ok
        abi.encodeCall(this.f2, (g2()));
        abi.encodeCall(this.f2, (g1(), g1())); // Ok
    }
}
// ----
// TypeError 9062: (331-335): Expected an inline tuple, not an expression of a tuple type.
// TypeError 9062: (415-419): Expected an inline tuple, not an expression of a tuple type.
// TypeError 6473: (456-460): Tuple component cannot be empty.
// TypeError 7788: (431-462): Expected 0 instead of 1 components for the tuple parameter.
// TypeError 7788: (519-550): Expected 2 instead of 1 components for the tuple parameter.
// TypeError 5407: (544-548): Cannot implicitly convert component at position 0 from "tuple(uint256,uint256)" to "uint256".
