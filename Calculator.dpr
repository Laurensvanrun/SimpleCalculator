// JCL_DEBUG_EXPERT_GENERATEJDBG OFF
program Calculator;

uses
  Vcl.Forms,
{$IFDEF USE_SPRING4D}
  Spring.Container,
{$ENDIF}
  UFmCalculator in 'UFmCalculator.pas' {CalculatorForm},
  UCalculator in 'UCalculator.pas',
  UIOperator in 'UIOperator.pas',
  UOperators in 'UOperators.pas',
  UICalculator in 'UICalculator.pas';

{$R *.res}

begin
{$IFDEF USE_SPRING4D}
  GlobalContainer.Build;
{$ENDIF}

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TCalculatorForm, CalculatorForm);
  Application.Run;
end.
