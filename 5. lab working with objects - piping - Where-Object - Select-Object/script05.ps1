
# Working with larger nested collections and objects
# piping, where-object, select-object
$MobilePhones = @(
    [PSCustomObject]@{
        Brand = "Samsung"
        Model = "S22 Extreme"
        ModelNumber = "22-5521-SD"
        Version = 22
        Storage = @("128GB", "256GB", "512GB")
        Colors = @("Boring White", "Pitch Black", "Blood Red")
        DefaultApps = @(
            @{
                Name = "Antivirus"
                Status = "Installed"
                Version = "1.2"
            },
            @{
                Name = "File Browser"
                Status = "Installed"
                Version = "2.41"
            }
        )
    },
    [PSCustomObject]@{
        Brand = "Apple"
        Model = "Iphone 16 Pro Ultra OMG"
        ModelNumber = "S-551-X11"
        Version = 16
        Storage = @("128GB", "256GB")
        Colors = @("Boring White", "Pitch Black", "Silver")
        DefaultApps = @(
            @{
                Name = "Antivirus"
                Status = "Installed"
                Version = "1.51"
            },
            @{
                Name = "Apple Spyware"
                Status = "Installed"
                Version = "101.11"
            }
        )
    }
)

# Printing out the whole $MobilePhones array
$MobilePhones

# Accessing the Value of an item in a hash map, in the array "DefaultApps", in a PSCustomObject, which is an item in the array $MobilePhones
Write-Host $MobilePhones[1].DefaultApps[1].Name

# Iterating over the $MobilePhones array with foreach, using pipes to filter with Where-Object and then filtering/selecting which properties to print
foreach ($MobilePhone in $MobilePhones) {
    $MobilePhone | Where-Object {$_.Brand -eq "Apple"} | Select-Object -Property Model, Version, Storage
}

# Same as above, but going one level deeper with a nested foreach loop, accessing items in the array of DefaultApps hash maps
foreach ($MobilePhone in $MobilePhones) {
    $MobilePhone | Where-Object {$_.Version -gt 15} | Select-Object -Property Model, Version, Storage
    foreach ($MobilePhoneDefaultApp in $MobilePhone.DefaultApps) {
        $MobilePhoneDefaultApp | Where-Object {$_.Status -eq "Installed"} | Select-Object -Property Name, Status
    }
}