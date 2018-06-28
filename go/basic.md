<!-- TOC -->

- [Go basics](#go-basics)
    - [Basic data types](#basic-data-types)
    - [Variables](#variables)
        - [Declaring single variable](#declaring-single-variable)
        - [Declaring variable with initial value](#declaring-variable-with-initial-value)
        - [Type inference](#type-inference)
        - [Multiple variable declaration](#multiple-variable-declaration)
        - [Short hand declaration](#short-hand-declaration)
    - [Constant](#constant)
    - [Functions](#functions)
    - [Packages](#packages)
        - [main function and main package](#main-function-and-main-package)
        - [Exported Names](#exported-names)
        - [init function](#init-function)
        - [Use of blank identifier](#use-of-blank-identifier)
    - [Conditional statement (if else)](#conditional-statement-if-else)
    - [Loop](#loop)
    - [Switch Statement](#switch-statement)

<!-- /TOC -->

# Go basics

In this section some basics of **go** are noted down.

## Basic data types

Go's basic data types are,

```go
bool

string

int  int8  int16  int32  int64
uint uint8 uint16 uint32 uint64 uintptr

byte // alias for uint8

rune // alias for int32
     // represents a Unicode code point

float32 float64

complex64 complex128
```

*Ref:* [A Tour of Go](https://tour.golang.org/basics/11)

## Variables

Variable is the name given to a memory location to store a value of a specific type.

### Declaring single variable

*Syntax:*
**var name type**

*Example:*

```go
var age int
```

### Declaring variable with initial value

*Syntax:*
**var name type = initialvalue**

*Example:*

```go
var age int = 29
```

### Type inference

If a variable has an initial value, Go will automatically be able to infer the type of that variable using that initial value.

*Syntax:*
**var name = initialvalue**

*Example:*

```go
var age = 29
```

### Multiple variable declaration

*Syntax:*
**var name1, name2 type**

*Example:*

```go
var width, height int
```

With initial value

```go
var width, height = 100, 50
```

Variables of different types

```go
 var (
        name   string
        age    int
        height float32
    )
```

with initial value

```go
 var (
        name   = "naveen"
        age    = 29
        height = 5.32
    )
```

### Short hand declaration

*Syntax:*
**name := initialvalue**

*Example:*

```go
name := "emruz"
age, weight := 24, 65
```

> Short hand syntax can only be used when at least one of the variables in the left side of := is newly declared.

```go
a, b := 20, 30 // declare variables a and b
b, c := 40, 50 // b is already declared but c is new
a, b := 40, 50 //error, no new variables
```

*Ref:* [GOLANGBOT.COM](https://golangbot.com/variables/)

## Constant

Once declared, can not be reassigned,

*Syntax:*
**const name = value**

*Example:*

```go
const a = 55 //allowed
a = 89 //reassignment not allowed
```

> The value of a constant should be known at compile time.

```go
var a = math.Sqrt(4)//allowed
const b = math.Sqrt(4)//not allowed
```

**b** is a constant and the value of **b** needs to be know at compile time. The function math.Sqrt(4) will be evaluated only during run time and hence const b = math.Sqrt(4) throws error.

>**Go is strongly typed language. So, mixing type during assignment is not allowed**.

Hence,

```go
var defaultName = "Sam" //allowed. type of defaultName is "string"
type myString string
var customName myString = "Sam" //allowed. type of customName is "myString"
customName = defaultName //not allowed. Error: cannot use defaultName (type string) as type myString in assignment
```

Although `myString` is alias of `string`, Go does not allow to assign `string` type variable into `myString` type variable.

>**Constant does not have a type. They can provide a type on the fly depending on the context.**

For example,

```go
package main
import "fmt"

func main() {
    const name = "Sam"
    const age = 24
    fmt.Printf("value: %v type: %T\n", name, name)
    fmt.Printf("value: %v type: %T\n", age, age)
}
```

Output:

```ini
value: Sam type: string
value: 24 type: int
```

Again,

```go
package main
import "fmt"

func main() {  
    const a = 5
    var intVar int = a
    var int32Var int32 = a
    var float64Var float64 = a
    var complex64Var complex64 = a
    fmt.Println("intVar",intVar, "\nint32Var", int32Var, "\nfloat64Var", float64Var, "\ncomplex64Var",complex64Var)
}
```

Output:

```ini
intVar 5
int32Var 5
float64Var 5
complex64Var (5+0i)
```

This program does not give any error because **a** is constant, so it does not have any type. When **a** is assigned to different type variable, it is taking type of this variable.

*Ref:* [GOLANGBOT.COM](https://golangbot.com/constants/)

## Functions

A function is a block of code that performs a specific task.

**Structure:**

```go
func functionname(parametername type) returntype {  
 //function body
}
```

**Sample function:**

```go
func calculateBill(price int, no int) int {  
    var totalPrice = price * no
    return totalPrice
}
```

If consecutive parameters has same type, writing type each time can be avoided by writing once at the end.

```go
func calculateBill(price, no int) int {  
    var totalPrice = price * no
    return totalPrice
}
```

**Multiple return value:**

```go
func rectProps(length, width float64)(float64, float64) {  
    var area = length * width
    var perimeter = (length + width) * 2
    return area, perimeter
}
```

**Named returned value:**

If a return value is named, it will be considered as a variable declared at the first line of the function. They don't need to return explicitly.

```go
func rectProps(length, width float64)(area, perimeter float64) {  
    area = length * width
    perimeter = (length + width) * 2
    return //no explicit return value
}
```

**Blank identifier:**
_ is know as the blank identifier in Go. It can be used in place of any value of any type. It is used to discard a returned value.

```go
func rectProps(length, width float64) (float64, float64) {  
    var area = length * width
    var perimeter = (length + width) * 2
    return area, perimeter
}
func main() {  
    area, _ := rectProps(10.8, 5.6) // perimeter is discarded
    fmt.Printf("Area %f ", area)
}
```

## Packages

Packages are used to organise go source code for better reusability and readability.

### main function and main package

Every executable go application must contain a main function. This function is the entry point for execution. The main function should reside in the main package.

>**First line of every go source file should be `package packagename` which indicate that this source file belong to which pakage.**

>**Source files belonging to a package should be placed in separate folders of their own. It is a convention in Go to name this folder with the same name of the package.**

*Package Example:*

Sample Go project structure:

```ini
src
 |-- geometry
        |-- geometry.go
        |-- rectangle
                |-- rectprops.go
```

rectangle package:

```go
//rectprops.go
package rectangle

import "math"

func Area(len, wid float64) float64 {  
    area := len * wid
    return area
}

func Diagonal(len, wid float64) float64 {  
    diagonal := math.Sqrt((len * len) + (wid * wid))
    return diagonal
}
```

main package:

```go
//geometry.go
package main 

import (  
    "fmt"
    "geometry/rectangle" //importing custom package
)

func main() {  
    var rectLen, rectWidth float64 = 6, 7
    fmt.Println("Geometrical shape properties")
        /*Area function of rectangle package used
        */
    fmt.Printf("area of rectangle %.2f\n", rectangle.Area(rectLen, rectWidth))
        /*Diagonal function of rectangle package used
        */
    fmt.Printf("diagonal of the rectangle %.2f ",rectangle.Diagonal(rectLen, rectWidth))
}
```

### Exported Names

Any variable or function which starts with a capital letter are exported names in go. Only exported functions and variables can be accessed from other packages.

### init function

Every package can have init function.

>**The init function should not have any return type and should not have any parameters.**

>**The init function cannot be called explicitly in our source code.**

*init function structure:*

```go
func init() {  
}
```

>**The init function can be used to perform initialisation tasks and can also be used to verify the correctness of the program before the execution starts.**

**The order of initialisation of a package:**

1. If a package imports other packages, the imported packages are initialised first.

2. Package level variables are initialised first.

3. init function is called next. A package can have multiple init functions (either in a single file or distributed across multiple files) and they are called in the order in which they are presented to the compiler.

>A package will be initialised only once even if it is imported from multiple packages.

**Initialisation Example:**

*rectangle package:*

```go
//rectprops.go
package rectangle

import "math"  
import "fmt"

/*
 * init function added
 */
func init() {  
    fmt.Println("rectangle package initialized")
}
func Area(len, wid float64) float64 {  
    area := len * wid
    return area
}

func Diagonal(len, wid float64) float64 {  
    diagonal := math.Sqrt((len * len) + (wid * wid))
    return diagonal
}
```

*main package:*

```go
//geometry.go
package main 

import (  
    "fmt"
    "geometry/rectangle" //importing custom package
    "log"
)
/*
 * 1. package variables
*/
var rectLen, rectWidth float64 = 6, 7 

/*
*2. init function to check if length and width are greater than zero
*/
func init() {  
    println("main package initialized")
    if rectLen < 0 {
        log.Fatal("length is less than zero")
    }
    if rectWidth < 0 {
        log.Fatal("width is less than zero")
    }
}

func main() {  
    fmt.Println("Geometrical shape properties")
    fmt.Printf("area of rectangle %.2f\n", rectangle.Area(rectLen, rectWidth))
    fmt.Printf("diagonal of the rectangle %.2f ",rectangle.Diagonal(rectLen, rectWidth))
}
```

Output:

```console
rectangle package initialized  
main package initialized  
Geometrical shape properties  
area of rectangle 42.00  
diagonal of the rectangle 9.22  
```

The order of initialisation of main package,

1. Imported package are initialized first. Hence, **rectangle** package will be initialized first.

2. Package level variable `rectLen` and `rectWidth` are initialized then.

3. Then, *init* function of main package is called.

4. Finally, *main* function is called.

### Use of blank identifier

Go does not allow to import any package without using it. So,

- If we want to import a package without using now but we may use later.

- Or, we want to make sure that initialization of a particular pakage happen even though we don't want to use it.

We can use blank identifier ( _ ).

```go
package main
import (
     _ "geometry/rectangle"
)
func main() {
}
```

## Conditional statement (if else)

 **Simple `if` structure:**

 ```go
 if condition {
     //statement
}
 ```

**`if-else` statement:**

```go
if condition {
    //statement
} else {
    //statement
}
```

**`if - else if - else` chain:**

```go
if condition {  
    //statement
} else if condition {
    //statement
} else {
    //statement
}
```

**`if` variant:**

```go
if statement; condition {  
    //statement
}
```

## Loop

Go has only **for** loop.

**`for` loop structure:**

```go
for initialisation; condition; post { 
    //statement
}
```

*Example:*

```go
for i := 1; i <= 10; i++ {
    fmt.Printf(" %d",i)
}
```

**`break`**

```go
for i := 1; i <= 10; i++ {
    if i > 5 {
        break //loop is terminated if i > 5
    }
    fmt.Printf("%d ", i)
}
```

**`continue`**

```go
for i := 1; i <= 10; i++ {
    if i%2 == 0 {
        continue
    }
    fmt.Printf("%d ", i)
}
```

*Variant:*

```go
for ;i <= 10; { // initialisation and post are omitted
    fmt.Printf("%d ", i)
    i += 2
}
```

```go
//multiple initialisation and increment
for no, i := 10, 1; i <= 10 && no <= 19; i, no = i+1, no+1 {
    fmt.Printf("%d * %d = %d\n", no, i, no*i)
}
```

**Infinite loop:**

```go
for {  
    // statement
}
```

## Switch Statement

**Structure:**

```go
switch finger {
case 1:
    // statement
case 2:
    // statement
case 3:
    // statement
default:
    // statement
}
```