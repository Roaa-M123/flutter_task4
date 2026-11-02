# flutter_task4(assignment Solutions)

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-Framework-blue?logo=flutter" />
  <img src="https://img.shields.io/badge/Dart-Language-blue?logo=dart" />
  <img src="https://img.shields.io/badge/Status-Completed-success" />
</p
---

## Table of Contents

- [Part 1: super.key](#part-1-superkey)
- [Part 2: const Usage](#part-2-const-usage)
- [Part 3: Private State](#part-3-private-state)
- [Part 4: Signup Page](#part-4-signup-page)
- [Part 5: Navigation](#part-5-navigation)
  - [Experiments](#experiments)
  - [Lifecycle Observations](#lifecycle-observations)
  - [Hidden Bug](#hidden-bug)

---

## Part 1: super.key

### What does super.key do?

`super.key` passes the key received by the widget constructor to its parent class (`StatefulWidget` or `StatelessWidget`).

The key helps Flutter identify widgets in the widget tree.

### Key vs GlobalKey<FormState>
 - What does super.key do? Where does the key go?
'super.key' passes the key received by the widget constructor
 to the parent class (StatefulWidget or StatelessWidget).
 The key is used by Flutter to identify widgets in the widget tree.


| Key | Purpose |
|---|---|
| `Key? key` | Identifies a widget in the widget tree. |
| `GlobalKey<FormState>` | Accesses and controls the FormState, such as validating the form using validate() to run each validator in each TextFormField.|

---

## Part 2: const Usage

### Why does const make Flutter faster?

`const`  means values are known at compile time.
 Flutter can reuse these constant widget instances instead of
creating new ones during rebuilds, reducing unnecessary work,useful for memory.


---

## Part 3: Private State

### What does `_` mean in Dart?

An underscore makes a class, variable, or method private to its Dart library.

In Dart, adding an underscore (_) makes a variable, method, or class private to its library (file) we can no access them out side its library.

State classes should be private because they are implementation details and should not be accessed directly from other files.

---


## Part 5: Navigation with GoRouter

### Difference between go() and push()

`push()` opens a new page on top of the current screen and adds it to the navigation stack.
 We can return to the previous page using 'pop()'.


`go()` navigates directly to a new location and updates the route configuration. The previous page is not kept as a page to return to using 'pop()'.

### Explain the difference between go and push using the word stack.
'context.push()' adds a new page on top of the current navigation
  stack, so we can return to the previous page using context.pop().

'context.go()' navigates directly to a location and updates the
 route configuration. It does not work like simply pushing
 a new page onto the navigation stack. we can not using pop to return again



### Experiments

#### Test 1: push() → pop()

**Result:**

 - Using push() opens the Signup page on top of Login.
 - Using pop() returns to the Login page.
 - The Login page remains in the navigation stack.
   
 - When using push("/signup"), the Signup page opens on top
 of the Login page.

 - When using pop(), the app returns to Login.
The Login page is not disposed when opening Signup,
so "finish Login" does not appear in the console.

**Console output:**
<img width="855" height="328" alt="Screenshot 2026-11-02 184519" src="https://github.com/user-attachments/assets/b6a31571-b54c-4494-ad2e-f21afbf94cc5" />


#### Test 2: go() → pop()

**Result:**
- Using go("/signup") navigates directly to the Signup page.
The Login page is disposed, and "finish Login" appears
in the console.

- When using pop(), there is no previous Login page to return to,
 so navigation cannot return to Login as expected and raise  the exception :

```text
There is nothing to pop
```
**Console output:**

<img width="1017" height="457" alt="Screenshot 2026-11-02 183838" src="https://github.com/user-attachments/assets/0aa56e37-0f26-4e2c-9add-bea57a0a34d4" />

#### Test 3: go() → go()

**Result:**
- Using go() navigates directly to Signup.
- Using go() again navigates directly to Login.
- The Login page opens successfully.
  
start Login=> start signup=>  finish Login=> start Login=> finish signup this order appears in console

- `go("/signup")` opens Signup.
- `go("/login")` navigates directly to Login.
- Navigation succeeds.
  

**Console output:**
<img width="606" height="86" alt="Screenshot 2026-11-02 184958" src="https://github.com/user-attachments/assets/3fe68655-b237-4c65-8c67-aae7f4af85b1" />
<img width="815" height="220" alt="Screenshot 2026-11-02 185006" src="https://github.com/user-attachments/assets/671678bb-6232-4b61-9cb9-cefaa4967906" />


#### Test 4: push() → Device/AppBar Back

**Result:**

- Signup opens above Login.
- Pressing the device or AppBar back button returns to Login.
- Signup is disposed.
- Login remains active.

### Lifecycle Observations

| Navigation | Login disposed? |
|---|---|
| push() | No |
| go() | Yes (observed in this experiment) |

---

## Hidden Bug

### Problem
Find the hidden bug
- Login goes to Home with context.go("/home"), but the "go back" button in Home calls context.pop().
- Press it. What happens and why?

**What happens and why?**
when press on "go back" button in Home this raise ExceptionThere is nothing to pop
Because we use `go()` that updates the route configuration instead of pushing Home onto the navigation stack. Therefore, Login is not necessarily available as a previous page.

### Solution: Logout

```dart
Database.isLoggedIn = false;
context.go("/login");
```

This updates the authentication state and navigates directly to Login.

---
