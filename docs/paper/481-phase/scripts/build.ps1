param(
    [string]$PdfLaTeX = "pdflatex",
    [string]$Python = "python"
)
$ErrorActionPreference = "Stop"
$paperRoot = Split-Path -Parent $PSScriptRoot
Push-Location -LiteralPath $paperRoot
try {
    New-Item -ItemType Directory -Force -Path "output/pdf", "evidence" | Out-Null
    & $Python "scripts/check_arithmetic.py" --output "evidence/arithmetic.json"
    if ($LASTEXITCODE -ne 0) { throw "Arithmetic check failed." }
    $texArgs = @("-interaction=nonstopmode", "-halt-on-error", "-file-line-error",
        "-jobname=no_three_in_line_481_en", "-output-directory=output/pdf", "main.tex")
    for ($pass = 1; $pass -le 3; $pass++) {
        & $PdfLaTeX @texArgs
        if ($LASTEXITCODE -ne 0) { throw "LaTeX pass $pass failed." }
    }
    Write-Output "Built output/pdf/no_three_in_line_481_en.pdf"
}
finally {
    Pop-Location
}
