unit UCalculator;

interface

uses
  UIOperator,
{$IFDEF USE_SPRING4D}
  Spring.Container.Common,
  Spring.Container,
{$ENDIF}
  UICalculator;

type
  TCalculator = class(TInterfacedObject, ICalculator)
  private
    FAdd, FSubstract, FFactorial: IOperator;

    FValue: Double;

    function GetValue: Double;
  protected
    function MethodWithMultiplePaths(AValue: Double): Double; virtual;
  public
{$IFDEF USE_SPRING4D}
    constructor Create([Inject('add')] AOperatorAdd, [Inject('substract')] AOperatorSubstract, [Inject('factorial')] AOperatorFactorial: IOperator);
{$ELSE}
    constructor Create(AOperatorAdd, AOperatorSubstract, AOperatorFactorial: IOperator);
{$ENDIF}

    procedure Clear;

    procedure Add(AValue: Double);
    procedure Substract(AValue: Double);
    procedure Factorial(AValue: Double);

    procedure DoSomethingComplex(AValue: Double);
    procedure DoSomethingComplexWithDoubleValue(AValue: Double);

    property Value: Double read GetValue;
  end;

implementation

{ TCalculator }

procedure TCalculator.Add(AValue: Double);
begin
  FValue := FAdd.Apply(FValue, AValue);
end;

procedure TCalculator.Clear;
begin
  FValue := 0;
end;

constructor TCalculator.Create(AOperatorAdd, AOperatorSubstract, AOperatorFactorial: IOperator);
begin
  FAdd := AOperatorAdd;
  FSubstract := AOperatorSubstract;
  FFactorial := AOperatorFactorial;

  Clear();
end;

procedure TCalculator.DoSomethingComplex(AValue: Double);
begin
  FValue := MethodWithMultiplePaths(AValue);
end;

procedure TCalculator.DoSomethingComplexWithDoubleValue(AValue: Double);
begin
  FValue := MethodWithMultiplePaths(AValue * 2);
end;

procedure TCalculator.Factorial(AValue: Double);
begin
  FValue := FFactorial.Apply(FValue, AValue);
end;

function TCalculator.GetValue: Double;
begin
  Result := FValue;
end;

function TCalculator.MethodWithMultiplePaths(AValue: Double): Double;
begin
  //How can I test this one?
  if (AValue > 1) and (AValue < 10) then
    Result := 1;
  if (AValue >= 10) and (AValue < 20) then
    Result := 2;
  if (AValue >= 30) and (AValue < 40) then
    Result := 2;
  if (AValue >= 40) and (AValue < 50) then
    Result := 2;
end;

procedure TCalculator.Substract(AValue: Double);
begin
  FValue := FSubstract.Apply(FValue, AValue);
end;

{$IFDEF USE_SPRING4D}
initialization
  GlobalContainer.RegisterType<ICalculator, TCalculator>;
{$ENDIF}

end.
