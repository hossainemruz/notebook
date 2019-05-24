- [How to do it in `go` ?](#how-to-do-it-in-go-)
  - [How to check if a program is installed or not?](#how-to-check-if-a-program-is-installed-or-not)
  - [How to know the path where a program is installed?](#how-to-know-the-path-where-a-program-is-installed)

# How to do it in `go` ?

This repo contains note about how to do certain things with golang.

## How to check if a program is installed or not?

```go
import (
      "os/exec"
      "testing"
)

func isCommandAvailable(name string) bool {
      cmd := exec.Command("command", "-v", name)
      if err := cmd.Run(); err != nil {
              return false
      }
      return true
}
func TestIsCommandAvailable(t *testing.T) {
      if isCommandAvailable("ls") == false {
              t.Error("ls command does not exist!")
      }
      if isCommandAvailable("ls111") == true {
              t.Error("ls111 command should not exist!")
      }
}
```

## How to know the path where a program is installed?

```go
package main

import (
  "fmt"
  "os/exec"
)

func main() {
  programName:= "ionice"
  installationPath,err:=exec.LookPath(programName)
  
  if err!=nil{
    fmt.Printf("Failed to detect the path of %q. Reason: %q.\n",programName,err.Error())
    return
  }

  fmt.Printf("Program %q installed in %q directory.\n",programName,installationPath)
}
```