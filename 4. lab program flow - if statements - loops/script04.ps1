
### Program flow

## If statements
Write-Host ""

$Weather = "Rainy"
if($Weather -eq "Sunny") {
    Write-Output "It seems to be $Weather."
    Write-Output "Wear a hat and maybe sunscreen!"
}
elseif ($Weather -eq "Rainy") {
    Write-Output "It seems to be $Weather."
    Write-Output "Better bring an umbrella!"
}
else {
    Write-Output "Never heard of that kind of weather.. better bring a towel!"
}
Write-Host ""

## Loops

# While loop, while (condition) {code, increment}
# Counting from 5 down to 0. The counter variable has to be declared first
$i = 5
Write-Host "while loop:"

while($i -ge 0) {
    Write-Host "Counting down: $i"
    $i--
}
Write-Host ""

# This is a regular for loop, for (counter; condition ; increment) {code}
Write-Host "regular for loop:"
for ($i=0; $i -lt 5; $i++) {
    write-host "Current iteration: $($i+1)" # +1 so it starts at 1, not 0 :-)
}
Write-Host ""

# This is the foreach loop, forach (iterator in iterable) {code}
# First create an array of colors to "loop through"
$Colours = @("Green", "Blue", "Black", "Yellow")

# Looping over each item of the array
Write-Host "for-each loop:"

foreach ($Colour in $Colours) {
    write-host "$Colour"
}
Write-Host ""

# Using a foreach loop to iterate over the key-value pairs of a hash table using GetEnumerator()
$ServerNames = @{
    Server01 = "Development"
    Server02 = "Testing"
    Server03 = "Production"
}

Write-Host "for-each loop, iterating over a hash table:"
foreach ($ServerName in $ServerNames.GetEnumerator()) {
    Write-Host "Key: $($ServerName.key) Value: $($ServerName.Value)"
}
Write-Host ""

## Iterating over collections with foreach loops
## An array of hash tables:
$Servers = @(
    @{ Name = "Server01"; Environment = "Development"; Status = "Online" },
    @{ Name = "Server02"; Environment = "Testing"; Status = "Offline" },
    @{ Name = "Server03"; Environment = "Production"; Status = "Online" }
)

# Iterating over the data sets with a foreach loop:
Write-Host "for-each loop, iterating over an array of hash tables:"
foreach ($Server in $Servers) {
    Write-Host "Servername: $($Server.Name), Environment: $($Server.Environment), Status: $($Server.Status)"
}
Write-Host ""

# Printing out the servers, based on if they are online or offline
Write-Host "for-each loop, iterating over an array of hash tables with if-condition:"
foreach ($Server in $Servers){
    if ($Server.Status -eq "Online") {
        Write-Host -ForegroundColor Green "The server <$($Server.Name)> in the $($Server.Environment) environment is <$($Server.Status)>. All good."
    }
    else {
        Write-Host -ForegroundColor Red "The server <$($Server.Name)> in the $($Server.Environment) environment is <$($Server.Status)>! Action required!!"
    }
}
Write-Host ""
