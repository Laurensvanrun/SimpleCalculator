unit UICalculator;

interface

type
  ICalculator = interface
  ['{BF187C12-21D6-470D-82AA-A459B811F46B}']
    function GetValue: Double;

    procedure Add(AValue: Double);
    procedure Substract(AValue: Double);
    procedure Factorial(AValue: Double);

    procedure Clear;

    property Value: Double read GetValue;
  end;

implementation

end.
