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