
## Arrays:
# this is the simple direct way of creating arrays
$CourseVideos = "Introduction", "Installation", "Use"
# $Numbers = 1, 2, 3, 4
# $FloatNumbers = 1.23, 3.34, 55.23

# the longer way of creating an array is
$Positions = @(
    "Start"
    "Middle"
    "End"
)

## Hash Tables:
$ServerNames = @{
    Development = "Server01"
    Testing = "Server02"
    Production = "Server03"
}

# Add items(value pairs) to a hash table:
$ServerNames.QA = "Server04"
$ServerNames.Add("Live", "Server05")

# Print the keys of a hash table:
Write-Host "Dumping all keys of a Hash table:"
Write-Host $ServerNames.Keys
Write-Host ""

# Accessing certain Values of a Hash table
Write-Host $($ServerNames[0].Key)
write-host $ServerNames.Development
Write-Host $ServerNames['Production']
Write-Host ""

# this is the for-each (item) .. version of the for loop
Write-Host "for-each loop:"
foreach ($video in $CourseVideos) {
    write-host "$video"
}
Write-Host ""

# this is a regular for loop, iterating as many times as there are items in the array
Write-Host "regular for loop:"
for ($i=0; $i -lt $Positions.Count; $i++) {
    write-host $Positions[$i]
}
Write-Host ""

# Iterating over they key-value pairs of a hash table using GetEnumerator()
Write-Host "for-each loop, iterating over a hash table:"
foreach ($ServerName in $ServerNames.GetEnumerator()) {
    Write-Host "Key: $($ServerName.Name) Value: $($ServerName.Key)"
}
