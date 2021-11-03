unit UTestCalculator;

interface

uses
  DUnitX.TestFramework, UICalculator, UIOperator, Delphi.Mocks;

type
  [TestFixture]
  TTestCalculator = class
  public
    [Test]
    procedure AddWorks;
    [Test]
    procedure TestMethodWithManyPaths;
    [Test]
    procedure DoSomethingComplex;
  end;

implementation

uses
  UCalculator;

{ TTestCalculator }

procedure TTestCalculator.AddWorks;
var
  Add: TMock<IOperator>;
  Calculator: ICalculator;
begin
  Add := TMock<IOperator>.Create;
  Calculator := TCalculator.Create(Add, nil, nil);

  Add.Setup.WillReturn(5).When.Apply(0,5);
  Add.Setup.Expect.Once.When.Apply(0,5);

  Calculator.Add(5);
  Assert.AreEqual<Double>(5, Calculator.Value);
  Add.VerifyAll();
end;

type
  TCalculatorForMock = class(TCalculator)
    public
      function MethodWithMultiplePaths(AValue: Double): Double; override; abstract;
  end;

procedure TTestCalculator.DoSomethingComplex;
var
  Calculator: TMock<TCalculatorForMock>;
begin
  Calculator := TMock<TCalculatorForMock>.Create(function: TCalculatorForMock begin Result := TCalculatorForMock.Create(nil, nil,nil) end);

  Calculator.Setup.WillReturn(5).When.MethodWithMultiplePaths(2);
  Calculator.Setup.Expect.Once.When.MethodWithMultiplePaths(2);
  Calculator.Setup.WillReturn(10).When.MethodWithMultiplePaths(4);
  Calculator.Setup.Expect.Once.When.MethodWithMultiplePaths(4);

  Calculator.Instance.DoSomethingComplex(2);
  Calculator.Instance.DoSomethingComplexWithDoubleValue(2);

  Calculator.VerifyAll();
end;

type
  TCalculatorAccess = class(TCalculator);

procedure TTestCalculator.TestMethodWithManyPaths;
var
  Calculator: TCalculator;
begin
  Calculator := TCalculator.Create(nil, nil, nil);
  try
    Assert.AreEqual<Double>(1, TCalculatorAccess(Calculator).MethodWithMultiplePaths(2));
  finally
    Calculator.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestCalculator);

end.
