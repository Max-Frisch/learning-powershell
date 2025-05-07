
$SecretNumber = Get-SecureRandom -Minimum 1 -Maximum 10
$Guess = $null

Write-Output ""
while ($Guess -ne $SecretNumber) {
    $Guess = Read-Host -Prompt "Guess a number between 1 and 10: "
    if ($Guess -eq $SecretNumber) {
        Write-Output "Ha! You guessed it! The number really was $Guess.`r`n"
    } elseif ($Guess -lt $SecretNumber) {
        Write-Output "$Guess is too low. Guess again ;-)"
    } else {
        Write-Output "$Guess is too high. Guess again ;-)"
    }
}