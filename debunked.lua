debunked={}

function debunked.loadfile(path)
    local file, err = io.open(path, "r")
    if not file then
        return nil, err  -- Return nil and the error if the file couldn't be opened
    end

    local content = file:read("*a")
    file:close()  -- Ensure the file is closed

    if not content then
        return nil, "Could not read file content"
    end

    local func, loadErr = load(content)  -- Load the content as a Lua function
    if not func then
        return nil, loadErr  -- Return nil and the error if loading fails
    end

    return func  -- Return the loaded function
end

return debunked
