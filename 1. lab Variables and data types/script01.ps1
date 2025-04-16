$x = 10
$y = 20
$FloatNum = 3.41

Write-Host $x
Write-Host $y

Write-Host ('The value of x is ' + $x)
Write-Host "The value of y is $y"

$z = $x + $y
Write-Host "The sum of $x and $y is $z"

$Name = "This is a String"
Write-Host $Name

$Name.GetType()
$z.GetType()
$FloatNum.GetType()