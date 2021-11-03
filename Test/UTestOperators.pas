unit UTestOperators;

interface

uses
  DUnitX.TestFramework;

type
  [TestFixture]
  TTestOperators = class
  public
    [Test]
    procedure Add;
    [Test]
    procedure Factorial;
  end;

implementation

{ TTestOperators }

uses
  UOperators, UIOperator;

procedure TTestOperators.Add;
var
  FAdd: IOperator;
begin
  FAdd := TOperatorAdd.Create;
  Assert.AreEqual<Double>(5, FAdd.Apply(0, 5));
  Assert.AreEqual<Double>(0, FAdd.Apply(-5, 5));
  Assert.AreEqual<Double>(6, FAdd.Apply(5, 1));
end;

procedure TTestOperators.Factorial;
var
  FFactorial: IOperator;
begin
  FFactorial := TOperatorFactorial.Create;
  Assert.WillRaise(procedure begin FFactorial.Apply(-1, 0) end, EFactorialException);
  Assert.AreEqual<Double>(1, FFactorial.Apply(0, 0));
  Assert.AreEqual<Double>(1, FFactorial.Apply(1, 0));
  Assert.AreEqual<Double>(2, FFactorial.Apply(2, 0));
  Assert.AreEqual<Double>(6, FFactorial.Apply(3, 0));
end;

initialization
  TDUnitX.RegisterTestFixture(TTestOperators);

end.
