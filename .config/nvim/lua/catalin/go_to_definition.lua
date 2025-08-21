local function get_index(table, val)
  for index, value in ipairs(table) do
    if value == val then
      return index
    end
  end

  return false
end

local function get_value(table, val)
  for index, value in ipairs(table) do
    if value == val then
      return value
    end
  end

  return nil
end

local function file_exists(filename)
  local file = io.open(filename, "r")
  if file then
    file:close()
    return true
  else
    return false
  end
end

function Go_to_definition()
    vim.lsp.buf.definition()
    Go_to_association()
end

function Go_to_association()
    local line_number = vim.api.nvim_win_get_cursor(0)[1]
    local line_contents = tostring(vim.api.nvim_buf_get_lines(0, line_number - 1, line_number, false)[1])
    local words = {}

    for word in line_contents:gmatch("%S+") do
      table.insert(words, word)
    end

    if words[1] == "belongs_to" or words[1] == "has_many" then
      local current_file = vim.fn.expand('%:t')
      local full_path = tostring(vim.fn.expand("%"))
      local associated_record = ""

      if get_value(words, "through:") ~= nil then
        -- if it's a through relationship get the next word after through
        associated_record = words[get_index(words, "through:") + 1]
        associated_record = string.gsub(associated_record, ":", "")
      else
        associated_record = string.gsub(words[2], ":", "")
      end

      associated_record = string.gsub(associated_record, ",", "")
      if words[1] == "has_many" then
        associated_record = string.sub(associated_record, 1, -2)
      end


      local path = string.gsub(full_path, current_file, associated_record)
      path = path.. ".rb"

      if file_exists(path) == true then
        vim.cmd.edit(path)
      else
        path = string.format("app/models/%s.rb", associated_record)

        if file_exists(path) == true then
          vim.cmd.edit(path)
        end
      end
    end
end

