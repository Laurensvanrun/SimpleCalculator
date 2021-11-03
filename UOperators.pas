unit UOperators;

interface

uses
  UIOperator, System.SysUtils, System.Math;

type
  TOperatorAdd = class(TInterfacedObject, IOperator)
    function Apply(ABase, AExtra: Double): Double;
  end;

  TOperatorSubstract = class(TInterfacedObject, IOperator)
    function Apply(ABase, AExtra: Double): Double;
  end;

  TOperatorFactorial = class(TInterfacedObject, IOperator)
    function Apply(ABase, AExtra: Double): Double;
  end;

  EFactorialException = class(Exception);

implementation

{$IFDEF USE_SPRING4D}
uses
  Spring.Container;
{$ENDIF}

{ TOperatorAdd }

function TOperatorAdd.Apply(ABase, AExtra: Double): Double;
begin
  Result := ABase + AExtra;
end;

{ TOperatorSubstract }

function TOperatorSubstract.Apply(ABase, AExtra: Double): Double;
begin
  Result := ABase - AExtra;
end;

{ TOperatorFactorial }

function TOperatorFactorial.Apply(ABase, AExtra: Double): Double;
var
  LWhile: Integer;
begin
  if ABase < 0 then
    raise EFactorialException.Create('Value should be above zero.');
  if ABase = 0 then
    ABase := 1;

  LWhile := Round(ABase);
  Result := LWhile;
  while (LWhile > 2) do begin
    LWhile := LWhile - 1;
    Result := Result * LWhile;
  end;
end;

{$IFDEF USE_SPRING4D}
initialization
  GlobalContainer.RegisterType<TOperatorAdd>.Implements<IOperator>('add')
    .DelegateTo(function: TOperatorAdd begin Result := TOperatorAdd.Create; end);
  GlobalContainer.RegisterType<TOperatorSubstract>.Implements<IOperator>('substract')
    .DelegateTo(function: TOperatorSubstract begin Result := TOperatorSubstract.Create; end);
  GlobalContainer.RegisterType<TOperatorFactorial>.Implements<IOperator>('factorial')
    .DelegateTo(function: TOperatorFactorial begin Result := TOperatorFactorial.Create; end);
{$ENDIF}

end.
