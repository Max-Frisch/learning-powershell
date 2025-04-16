
## Arrays:

# This is the simple direct(in-line?) way of creating arrays
$CourseVideos = "Introduction", "Installation", "Use"
# $Numbers = 1, 2, 3, 4
# $FloatNumbers = 1.23, 3.34, 55.23

# The proper way of creating an array
$Positions = @(
    "Start"
    "Middle"
    "End"
)

# Printing out arrays
Write-Host $CourseVideos
Write-Host $Positions[0]
Write-Host ""

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
write-host $ServerNames.Development
Write-Host $ServerNames['Production']

