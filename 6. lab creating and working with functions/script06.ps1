
## PowerShell functions

# Basic function to print out the current powershell version, no parameters(inputs into the function)
function Get-Appversion {
    $PSVersionTable.PSVersion
}

# Direct function call
Get-Appversion

Write-Host ""

# Print out the return value of the function with Write-Host
Write-Host (Get-Appversion)

Write-Host ""

# Print out the return value with string interpolation
Write-Host "The current Powershell version installed is: $(Get-Appversion)"

# Creating a basic function, which accepts 2 parameters
function Add-Integers($x1, $x2) {
    return ($x1 + $x2)
}

# Direct function call - In powershell arguments are just added after the function name, like on the command line directly. So not Add-Integers(5,12) <- this fails the function call, bcs no arguments given and just prints 5 and 12 to the terminal! PowerShell is Powerful, but different x_x
Add-Integers 5 12

# Using type-hinting to enfore type-safety AND for readability for the programmers(expected types)
function Get-UpperCase([string]$text) {
    $text.ToUpper()
}
Get-UpperCase "hello world!"

function Add-Numbers([int]$num1, [int]$num2) {
    return [int]($num1 + $num2)
}
Add-Numbers 5 12
Add-Numbers 5 "12" # the string "12" is automatically cast to int
# Add-Numbers 5 "twelve" # here "twelve" is a string and can not be automatically/implicitly cast to int -> throws an error!

# The more idiomatic way for input parameters is to use the param() block instead of inline parameters
function Add-Five {
    param(
        [int]$num
    )
    Write-Output ($num+5)
}
Add-Five 5


# This function accepts input via the pipeline using "|".
# It doesn’t enable true "pipeline support"; instead, it “accidentally” works
# because the parameter is named $Input, which shadows PowerShell's automatic $Input variable.
# As a result, PowerShell collects the piped values (as an array) and passes them
# to the function, mimicking proper pipeline input handling.
function Get-UpperCase {
    param([string]$Input)
    Write-Output $Input.ToUpper()
}
"hello", "world" | Get-UpperCase

# This does <NOT> produce any output, as $Something now truely is a "random" variable name, not shadowing and behaving like the $Input variable and pipeline input is not automatically bound to the input parameter!
function Get-UpperCase {
    param([string]$Something)
    Write-Output $Something.ToUpper()
}
"hello", "world" | Get-UpperCase  # No output!


# This is a "real" example, using the built-in "automatic variable" $Input the intented way.
# No input parameters are defined, so any input arguments are auto(magically) bound to the $Input variable and "put into the function" one by one
function Get-UpperCase {
    foreach ($item in $Input) {
        Write-Output $item.ToUpper()
    }
}
"hello", "world", "!" | Get-UpperCase


# To properly enable "pipeline support", aka make the function able to handle and process objects coming in from and out to the pipeline:
# (As far as I understand it..) [CmdletBinding()] declares it as an advanced funtion/ PS commandlet(?)
# The [Parameter(ValueFromPipeline)] -parameter is added in the param() block, before the input variable
# The process{} block ..processes each input individually and sends it back to the pipeline
function Get-UpperCase {
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline)]
        [string]$Something
    )
    process {
        Write-Output $Something.ToUpper()
    }
}
"hello", "world", "blah" | Get-UpperCase

# Passing in an object into a function. In this case an Array of PSCustomObjects

# Creating the $People array from before
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

function Get-People {
    [CmdletBinding()]
    param(
        [Object[]] $People
    )
    foreach ($Person in $People) {
        # $Person.Name
        # $Person.Age
        # $Person.Sex
        # Write-Host ""
        $Person
    }
}

Get-People $People