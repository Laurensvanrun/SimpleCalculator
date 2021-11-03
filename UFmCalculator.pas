unit UFmCalculator;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, UICalculator, Vcl.StdCtrls, Vcl.Controls,
  Vcl.Forms;

type
  TCalculatorForm = class(TForm)
    ButtonAdd: TButton;
    ButtonSubstract: TButton;
    LabelResult: TLabel;
    EditValue: TEdit;
    ButtonFactorial: TButton;
    ButtonClear: TButton;
    procedure ButtonFactorialClick(Sender: TObject);
    procedure ButtonClearClick(Sender: TObject);
    procedure ButtonAddClick(Sender: TObject);
    procedure ButtonSubstractClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FCalculator: ICalculator;
  public
    { Public declarations }
    procedure Test;
  end;

var
  CalculatorForm: TCalculatorForm;

implementation

uses
  UCalculator,
{$IFDEF USE_SPRING4D}
  Spring.Container,
{$ENDIF}
  UOperators;

{$R *.dfm}

procedure TCalculatorForm.ButtonFactorialClick(Sender: TObject);
begin
  FCalculator.Factorial(StrToFloat(EditValue.Text));
  LabelResult.Caption := FCalculator.Value.ToString;
end;

procedure TCalculatorForm.ButtonClearClick(Sender: TObject);
begin
  FCalculator.Clear;
  LabelResult.Caption := FCalculator.Value.ToString;
end;

procedure TCalculatorForm.ButtonAddClick(Sender: TObject);
begin
  FCalculator.Add(StrToFloat(EditValue.Text));
  LabelResult.Caption := FCalculator.Value.ToString;
end;

procedure TCalculatorForm.ButtonSubstractClick(Sender: TObject);
begin
  FCalculator.Substract(StrToFloat(EditValue.Text));
  LabelResult.Caption := FCalculator.Value.ToString;
end;

procedure TCalculatorForm.FormCreate(Sender: TObject);
begin
{$IFDEF USE_SPRING4D}
  FCalculator := GlobalContainer.Resolve<ICalculator>();
{$ELSE}
  FCalculator := TCalculator.Create(TOperatorAdd.Create, TOperatorSubstract.Create, TOperatorFactorial.Create);
{$ENDIF}
end;

procedure TCalculatorForm.Test;
var
  A, B, C: Integer;
begin
  A := 10;
  if B > C then
    A := B
  else
    A := C;
end;

end.
