-- Syntax Errors
local function syntax_error()
    if true then
        print("This is fine"
    end  -- Missing end parenthesis in print statement
end

-- Undefined Variables
local function undefined_vars()
    local x = 10
    print(y)  -- y is not defined
    z = 20  -- Global variable implicitly declared
end

-- Incorrect Function Calls
local function incorrect_calls()
    local function greet(name)
        return "Hello, " .. name
    end
    
    print(greet())  -- Missing argument
    print(greet("Alice", "Bob"))  -- Too many arguments
end

-- Type Mismatches
local function type_mismatches()
    local str = "42"
    local num = 10
    print(str + num)  -- Attempting to add string and number
end

-- Unused Variables
local function unused_vars()
    local unused = "I'm not used anywhere"
    local used = "I'm used"
    print(used)
end

-- Incorrect Table Access
local function table_errors()
    local t = {x = 1, y = 2}
    print(t.z)  -- Accessing non-existent table key
    t.x.y = 3  -- Attempting to index a number value
end

-- Scope Issues
local x = 10
local function scope_issues()
    print(x)  -- This is fine
    local x = 20
    print(x)  -- This shadows the outer x
end
print(x)  -- This refers to the outer x

-- Main execution
syntax_error()
undefined_vars()
incorrect_calls()
type_mismatches()
unused_vars()
table_errors()
scope_issues()
