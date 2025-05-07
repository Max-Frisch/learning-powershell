
## Objects - creating .net custom objects
# Creating a single object
$Person = [PSCustomObject]@{
    Name = "Peter"
    Age  = 31
    Sex  = "male"
}

# Printing out the whole object
Write-Output $Person

# Accessing a value of a property
Write-Output $Person.Name


# Creating an array of objects
$People = @(
    [PSCustomObject]@{
        Name = "Peter"
        Age  = 31
        Sex  = "male"
    },
    [PSCustomObject]@{
        Name = "Bob"
        Age  = 25
        Sex  = "male"
    },
    [PSCustomObject]@{
        Name = "Steffi"
        Age  = 40
        Sex  = "female"
    }
)

# Printing out the array of objects
Write-Output $People

# Access a specific object in the array, using the array's index [x] and the object's property
Write-Output $People[2]
Write-Output $People[1].Name